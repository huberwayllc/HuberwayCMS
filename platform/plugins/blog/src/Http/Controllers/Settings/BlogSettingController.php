<?php

namespace HuberwayCMS\Blog\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Blog\Forms\Settings\BlogSettingForm;
use HuberwayCMS\Blog\Http\Requests\Settings\BlogSettingRequest;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class BlogSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/blog::base.settings.title'));

        return BlogSettingForm::create()->renderForm();
    }

    public function update(BlogSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
