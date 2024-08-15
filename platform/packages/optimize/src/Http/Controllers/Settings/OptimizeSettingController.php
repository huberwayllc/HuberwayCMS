<?php

namespace HuberwayCMS\Optimize\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Optimize\Forms\Settings\OptimizeSettingForm;
use HuberwayCMS\Optimize\Http\Requests\OptimizeSettingRequest;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class OptimizeSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('packages/optimize::optimize.settings.title'));

        return OptimizeSettingForm::create()->renderForm();
    }

    public function update(OptimizeSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
