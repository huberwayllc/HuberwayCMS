<?php

namespace HuberwayCMS\Ads\Http\Controllers;

use HuberwayCMS\Ads\Models\Ads;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;

class PublicController extends BaseController
{
    public function getAdsClick(string $key, BaseHttpResponse $response)
    {
        $ads = Ads::query()->where('key', $key)->first();

        if (! $ads || ! $ads->url) {
            return $response->setNextUrl(route('public.single'));
        }

        $ads::withoutEvents(fn () => $ads::withoutTimestamps(fn () => $ads->increment('clicked')));

        return $response->setNextUrl($ads->url);
    }
}
