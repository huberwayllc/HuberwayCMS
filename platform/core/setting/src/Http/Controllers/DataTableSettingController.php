<?php

namespace HuberwayCMS\Setting\Http\Controllers;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Setting\Forms\DataTableSettingForm;
use HuberwayCMS\Setting\Http\Requests\DataTableSettingRequest;

class DataTableSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('core/setting::setting.datatable.title'));

        return DataTableSettingForm::create()->renderForm();
    }

    public function update(DataTableSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
