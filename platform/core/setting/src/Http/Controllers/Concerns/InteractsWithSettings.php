<?php

namespace HuberwayCMS\Setting\Http\Controllers\Concerns;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Setting\Facades\Setting;

trait InteractsWithSettings
{
    protected function saveSettings(array $data, string $prefix = ''): void
    {
        foreach ($data as $settingKey => $settingValue) {
            if (is_array($settingValue)) {
                $settingValue = json_encode(array_filter($settingValue));
            }

            Setting::set($prefix . $settingKey, (string) $settingValue);
        }

        Setting::save();
    }

    protected function performUpdate(array $data, string $prefix = ''): BaseHttpResponse
    {
        $this->saveSettings($data, $prefix);

        if (! method_exists($this, 'httpResponse')) {
            return BaseHttpResponse::make();
        }

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }
}
