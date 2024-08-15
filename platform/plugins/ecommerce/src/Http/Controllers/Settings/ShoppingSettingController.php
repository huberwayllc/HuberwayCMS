<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Forms\Settings\ShoppingSettingForm;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\ShoppingSettingRequest;

class ShoppingSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.shopping.name'));

        return ShoppingSettingForm::create()->renderForm();
    }

    public function update(ShoppingSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
