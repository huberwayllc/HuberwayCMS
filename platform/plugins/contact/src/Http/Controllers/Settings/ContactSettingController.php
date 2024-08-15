<?php

namespace HuberwayCMS\Contact\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Contact\Forms\Settings\ContactSettingForm;
use HuberwayCMS\Contact\Http\Requests\Settings\ContactSettingRequest;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class ContactSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/contact::contact.settings.title'));

        return ContactSettingForm::create()->renderForm();
    }

    public function update(ContactSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
