<?php

namespace HuberwayCMS\Shippo\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Ecommerce\Services\HandleShippingFeeService;
use HuberwayCMS\Setting\Supports\SettingStore;
use HuberwayCMS\Shippo\Shippo;
use HuberwayCMS\Support\Services\Cache\Cache;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class ShippoSettingController extends BaseController
{
    public function update(Request $request, BaseHttpResponse $response, SettingStore $settingStore)
    {
        $data = Arr::where($request->except(['_token']), function ($value, $key) {
            return Str::startsWith($key, 'shipping_');
        });

        foreach ($data as $settingKey => $settingValue) {
            $settingStore->set($settingKey, $settingValue);
        }

        $settingStore->save();

        $cache = new Cache(app('cache'), HandleShippingFeeService::class);
        $cache->flush();

        $message = trans('plugins/shippo::shippo.saved_shipping_settings_success');
        $isError = false;

        if ($request->input('shipping_shippo_validate')) {
            $errors = app(Shippo::class)->validate();
            if ($errors) {
                $message = $errors[0];
                $isError = true;
            }
        }

        return $response->setError($isError)->setMessage($message);
    }
}
