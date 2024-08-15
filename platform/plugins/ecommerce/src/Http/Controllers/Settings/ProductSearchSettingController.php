<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Forms\Settings\ProductSearchSettingForm;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\ProductSearchSettingRequest;

class ProductSearchSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.product_search.name'));

        return ProductSearchSettingForm::create()->renderForm();
    }

    public function update(ProductSearchSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
