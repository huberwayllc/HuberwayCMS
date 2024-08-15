<?php

namespace HuberwayCMS\Faq\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Faq\Forms\Settings\FaqSettingForm;
use HuberwayCMS\Faq\Http\Requests\Settings\FaqSettingRequest;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class FaqSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/faq::faq.settings.title'));

        return FaqSettingForm::create()->renderForm();
    }

    public function update(FaqSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
