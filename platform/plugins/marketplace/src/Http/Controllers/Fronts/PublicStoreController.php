<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Fronts;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Services\Products\GetProductService;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Marketplace\Http\Requests\Fronts\CheckStoreUrlRequest;
use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Media\Facades\RvMedia;
use HuberwayCMS\SeoHelper\Facades\SeoHelper;
use HuberwayCMS\SeoHelper\SeoOpenGraph;
use HuberwayCMS\Slug\Facades\SlugHelper;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class PublicStoreController extends BaseController
{
    public function getStores(Request $request)
    {
        Theme::breadcrumb()
            ->add(__('Stores'), route('public.stores'));

        SeoHelper::setTitle(__('Stores'))->setDescription(__('Stores'));

        $condition = [];

        $search = BaseHelper::stringify(BaseHelper::clean($request->input('q')));
        if ($search) {
            $condition[] = ['name', 'LIKE', '%' . $search . '%'];
        }

        $with = ['slugable'];
        if (EcommerceHelper::isReviewEnabled()) {
            $with['reviews'] = function ($query) {
                $query->where([
                    'ec_products.status' => BaseStatusEnum::PUBLISHED,
                    'ec_reviews.status' => BaseStatusEnum::PUBLISHED,
                ]);
            };
        }

        $stores = Store::query()
            ->wherePublished()
            ->where($condition)
            ->with($with)
            ->withCount([
                'products' => function ($query) {
                    $query->wherePublished();
                },
            ])
            ->orderByDesc('created_at')
            ->paginate(12);

        return Theme::scope('marketplace.stores', compact('stores'), MarketplaceHelper::viewPath('stores', false))->render();
    }

    public function getStore(
        string $key,
        Request $request,
        GetProductService $productService
    ) {
        $slug = SlugHelper::getSlug($key, SlugHelper::getPrefix(Store::class));

        if (! $slug) {
            abort(404);
        }

        $condition = [
            'mp_stores.id' => $slug->reference_id,
            'mp_stores.status' => BaseStatusEnum::PUBLISHED,
        ];

        if (Auth::check() && $request->input('preview')) {
            Arr::forget($condition, 'status');
        }

        $store = Store::query()
            ->wherePublished()
            ->with(['slugable', 'metadata'])
            ->where($condition)
            ->firstOrFail();

        if ($store->slugable->key !== $slug->key) {
            return redirect()->to($store->url);
        }

        SeoHelper::setTitle($store->name)->setDescription($store->description);

        $meta = new SeoOpenGraph();
        if ($store->logo) {
            $meta->setImage(RvMedia::getImageUrl($store->logo));
        }
        $meta->setDescription($store->description);
        $meta->setUrl($store->url);
        $meta->setTitle($store->name);

        SeoHelper::setSeoOpenGraph($meta);

        Theme::breadcrumb()
            ->add(__('Stores'), route('public.stores'))
            ->add($store->name, $store->url);

        $with = EcommerceHelper::withProductEagerLoadingRelations();

        $products = $productService->getProduct($request, null, null, $with, [], ['store_id' => $store->id]);

        if ($request->ajax()) {
            $total = $products->total();
            $message = $total > 1 ? __(':total Products found', compact('total')) : __(
                ':total Product found',
                compact('total')
            );

            $view = Theme::getThemeNamespace('views.marketplace.stores.items');

            if (! view()->exists($view)) {
                $view = MarketplaceHelper::viewPath('stores.items', false);
            }

            return $this
                ->httpResponse()
                ->setData(view($view, compact('products', 'store'))->render())
                ->setMessage($message);
        }

        return Theme::scope('marketplace.store', compact('store', 'products'), MarketplaceHelper::viewPath('store', false))->render();
    }

    public function checkStoreUrl(CheckStoreUrlRequest $request)
    {
        if (! $request->ajax()) {
            abort(404);
        }

        $slug = $request->input('url');
        $slug = Str::slug($slug, '-', ! SlugHelper::turnOffAutomaticUrlTranslationIntoLatin() ? 'en' : false);

        $existing = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Store::class));

        $this->httpResponse()->setData(['slug' => $slug]);

        if ($existing && $existing->reference_id != $request->input('reference_id')) {
            return $this->httpResponse()
                ->setError()
                ->setMessage(__('Not Available'));
        }

        return $this->httpResponse()->setMessage(__('Available'));
    }
}
