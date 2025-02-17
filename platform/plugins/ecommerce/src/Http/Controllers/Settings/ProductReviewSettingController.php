<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Forms\Settings\ProductReviewSettingForm;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\ProductReviewSettingRequest;

class ProductReviewSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.product_review.name'));

        return ProductReviewSettingForm::create()->renderForm();
    }

    public function update(ProductReviewSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
