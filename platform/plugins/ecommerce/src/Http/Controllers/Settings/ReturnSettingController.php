<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Forms\Settings\ReturnSettingForm;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\ReturnSettingRequest;

class ReturnSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.shopping.return_settings'));

        return ReturnSettingForm::create()->renderForm();
    }

    public function update(ReturnSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
