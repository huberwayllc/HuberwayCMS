<?php

namespace HuberwayCMS\Analytics\Http\Controllers\Settings;

use HuberwayCMS\Analytics\Forms\AnalyticsSettingForm;
use HuberwayCMS\Analytics\Http\Requests\Settings\AnalyticsSettingRequest;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class AnalyticsSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/analytics::analytics.settings.title'));

        return AnalyticsSettingForm::create()->renderForm();
    }

    public function update(AnalyticsSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
