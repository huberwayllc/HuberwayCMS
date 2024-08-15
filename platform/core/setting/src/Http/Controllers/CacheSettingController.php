<?php

namespace HuberwayCMS\Setting\Http\Controllers;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Setting\Forms\CacheSettingForm;
use HuberwayCMS\Setting\Http\Requests\CacheSettingRequest;

class CacheSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('core/setting::setting.cache.title'));

        return CacheSettingForm::create()->renderForm();
    }

    public function update(CacheSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
