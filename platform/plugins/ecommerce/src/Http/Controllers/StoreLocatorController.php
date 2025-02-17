<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Http\Requests\StoreLocatorRequest;
use HuberwayCMS\Ecommerce\Models\StoreLocator;
use HuberwayCMS\Setting\Supports\SettingStore;

class StoreLocatorController extends BaseController
{
    public function store(StoreLocatorRequest $request)
    {
        StoreLocator::query()->create([
            ...$request->validated(),
            'is_primary' => false,
        ]);

        return $this
            ->httpResponse()
            ->withCreatedSuccessMessage();
    }

    public function edit(int|string|null $id = null)
    {
        $locator = $id ? StoreLocator::query()->findOrFail($id) : null;

        return $this
            ->httpResponse()
            ->setData(view('plugins/ecommerce::settings.store-locator-item', compact('locator'))->render());
    }

    public function update(StoreLocator $locator, StoreLocatorRequest $request, SettingStore $settingStore)
    {
        $locator->update($request->validated());

        if ($locator->is_primary) {
            $prefix = EcommerceHelper::getSettingPrefix();

            $settingStore
                ->set([
                    $prefix . 'store_phone' => $locator->phone,
                    $prefix . 'store_address' => $locator->address,
                    $prefix . 'store_country' => $locator->country,
                    $prefix . 'store_state' => $locator->state,
                    $prefix . 'store_city' => $locator->city,
                ])
                ->save();
        }

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function destory(StoreLocator $locator)
    {
        $locator->delete();

        return $this
            ->httpResponse()
            ->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
