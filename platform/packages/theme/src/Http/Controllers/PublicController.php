<?php

namespace HuberwayCMS\Theme\Http\Controllers;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Page\Models\Page;
use HuberwayCMS\Page\Services\PageService;
use HuberwayCMS\SeoHelper\Facades\SeoHelper;
use HuberwayCMS\Slug\Facades\SlugHelper;
use HuberwayCMS\Theme\Events\RenderingHomePageEvent;
use HuberwayCMS\Theme\Events\RenderingSingleEvent;
use HuberwayCMS\Theme\Events\RenderingSiteMapEvent;
use HuberwayCMS\Theme\Facades\SiteMapManager;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class PublicController extends BaseController
{
    public function getIndex()
    {
        if (
            defined('PAGE_MODULE_SCREEN_NAME') &&
            ($homepageId = BaseHelper::getHomepageId()) &&
            ($slug = SlugHelper::getSlug(null, null, Page::class, $homepageId))
        ) {
            $data = (new PageService())->handleFrontRoutes($slug);

            if (! $data) {
                return Theme::scope('index')->render();
            }

            event(new RenderingSingleEvent($slug));

            return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
        }

        SeoHelper::setTitle(theme_option('site_title'));

        event(RenderingHomePageEvent::class);

        return Theme::scope('index')->render();
    }

    public function getView(string|null $key = null, string $prefix = '')
    {
        if (empty($key)) {
            return $this->getIndex();
        }

        $slug = SlugHelper::getSlug($key, $prefix);

        if (! $slug) {
            abort(404);
        }

        if (
            defined('PAGE_MODULE_SCREEN_NAME') &&
            $slug->reference_type === Page::class &&
            BaseHelper::isHomepage($slug->reference_id)
        ) {
            return redirect()->route('public.index');
        }

        $result = apply_filters(BASE_FILTER_PUBLIC_SINGLE_DATA, $slug);

        $extension = SlugHelper::getPublicSingleEndingURL();

        if ($extension) {
            $key = Str::replaceLast($extension, '', $key);
        }

        if ($result instanceof BaseHttpResponse) {
            return $result;
        }

        if (isset($result['slug']) && $result['slug'] !== $key) {
            $prefix = SlugHelper::getPrefix(get_class(Arr::first($result['data'])));

            return redirect()->route('public.single', empty($prefix) ? $result['slug'] : "$prefix/{$result['slug']}");
        }

        event(new RenderingSingleEvent($slug));

        if (! empty($result) && is_array($result)) {
            if (isset($result['view'])) {
                return Theme::scope($result['view'], $result['data'], Arr::get($result, 'default_view'))->render();
            }

            return $result;
        }

        abort(404);
    }

    public function getSiteMap()
    {
        return $this->getSiteMapIndex();
    }

    public function getSiteMapIndex(string $key = null, string $extension = 'xml')
    {
        if ($key == 'sitemap') {
            $key = null;
        }

        if (! SiteMapManager::init($key, $extension)->isCached()) {
            event(new RenderingSiteMapEvent($key));
        }

        // show your site map (options: 'xml' (default), 'html', 'txt', 'ror-rss', 'ror-rdf')
        return SiteMapManager::render($key ? $extension : 'sitemapindex');
    }

    public function getViewWithPrefix(string $prefix, string|null $slug = null)
    {
        return $this->getView($slug, $prefix);
    }
}
