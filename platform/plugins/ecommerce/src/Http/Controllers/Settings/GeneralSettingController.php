<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Forms\Settings\GeneralSettingForm;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\GeneralSettingRequest;

class GeneralSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.general.name'));

        return GeneralSettingForm::create()->renderForm();
    }

    public function update(GeneralSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
