<?php

namespace HuberwayCMS\Captcha\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Captcha\Forms\CaptchaSettingForm;
use HuberwayCMS\Captcha\Http\Requests\Settings\CaptchaSettingRequest;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class CaptchaSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/captcha::captcha.settings.title'));

        return CaptchaSettingForm::create()->renderForm();
    }

    public function update(CaptchaSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
