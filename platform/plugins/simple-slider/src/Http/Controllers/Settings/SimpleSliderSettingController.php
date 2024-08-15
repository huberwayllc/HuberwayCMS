<?php

namespace HuberwayCMS\SimpleSlider\Http\Controllers\Settings;

use HuberwayCMS\Setting\Http\Controllers\SettingController;
use HuberwayCMS\SimpleSlider\Forms\Settings\SimpleSliderSettingForm;
use HuberwayCMS\SimpleSlider\Http\Requests\Settings\SimpleSliderSettingRequest;

class SimpleSliderSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/simple-slider::simple-slider.settings.title'));

        return SimpleSliderSettingForm::create()->renderForm();
    }

    public function update(SimpleSliderSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
