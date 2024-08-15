<?php

namespace HuberwayCMS\Newsletter\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Newsletter\Forms\NewsletterSettingForm;
use HuberwayCMS\Newsletter\Http\Requests\Settings\NewsletterSettingRequest;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class NewsletterSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/newsletter::newsletter.settings.title'));

        return NewsletterSettingForm::create()->renderForm();
    }

    public function update(NewsletterSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
