<?php

namespace HuberwayCMS\Setting\Http\Controllers;

use HuberwayCMS\Base\Facades\AdminAppearance;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Setting\Forms\AdminAppearanceSettingForm;
use HuberwayCMS\Setting\Http\Requests\AdminAppearanceRequest;
use Illuminate\Support\Arr;

class AdminAppearanceSettingController extends SettingController
{
    public function index()
    {
        $this->pageTitle(trans('core/setting::setting.admin_appearance.title'));

        return AdminAppearanceSettingForm::create()->renderForm();
    }

    public function update(AdminAppearanceRequest $request): BaseHttpResponse
    {
        $localeDirectionKey = AdminAppearance::getSettingKey('locale_direction');

        $data = Arr::except($request->validated(), [$localeDirectionKey]);

        $isDemoModeEnabled = BaseHelper::hasDemoModeEnabled();

        $adminLocalDirection = $request->input($localeDirectionKey);

        if ($adminLocalDirection != setting($localeDirectionKey)) {
            session()->put('admin_locale_direction', $adminLocalDirection);
        }

        if (! $isDemoModeEnabled) {
            $data[$localeDirectionKey] = $adminLocalDirection;
        }

        return $this->performUpdate($data);
    }
}
