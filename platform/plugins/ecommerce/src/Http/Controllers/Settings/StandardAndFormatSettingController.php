<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Forms\Settings\StandardAndFormatSettingForm;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\StandardAndFormatSettingRequest;

class StandardAndFormatSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.standard_and_format.name'));

        return StandardAndFormatSettingForm::create()->renderForm();
    }

    public function update(StandardAndFormatSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
