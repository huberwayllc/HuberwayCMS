<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Setting\Http\Controllers\SettingController as BaseSettingController;

abstract class SettingController extends BaseSettingController
{
    protected function saveSettings(array $data, string $prefix = ''): void
    {
        parent::saveSettings($data, EcommerceHelper::getSettingPrefix());
    }
}
