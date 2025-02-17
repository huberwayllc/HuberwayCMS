<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Fronts;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Models\Currency;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class PublicEcommerceController extends BaseController
{
    public function changeCurrency(Request $request, string|null $title = null)
    {
        if (empty($title)) {
            $title = $request->input('currency');
        }

        if (! $title) {
            return $this->httpResponse();
        }

        $currency = Currency::query()->where('title', $title)->first();

        if ($currency) {
            cms_currency()->setApplicationCurrency($currency);
        }

        $url = URL::previous();

        if (! $url || $url === URL::current()) {
            return $this
                ->httpResponse()
                ->setNextUrl(route('public.index'));
        }

        if (Str::contains($url, ['min_price', 'max_price'])) {
            $url = preg_replace('/&min_price=[0-9]+/', '', $url);
            $url = preg_replace('/&max_price=[0-9]+/', '', $url);
        }

        return $this
            ->httpResponse()
            ->setNextUrl($url);
    }
}
