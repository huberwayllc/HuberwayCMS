<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Settings;

use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Setting\Http\Controllers\SettingController as BaseSettingController;

abstract class SettingController extends BaseSettingController
{
    protected function saveSettings(array $data, string $prefix = ''): void
    {
        parent::saveSettings($data, MarketplaceHelper::getSettingKey());
    }
}
