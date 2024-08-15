<?php

namespace HuberwayCMS\Analytics\Http\Requests\Settings;

use HuberwayCMS\Analytics\Rules\AnalyticsCredentialRule;
use HuberwayCMS\Support\Http\Requests\Request;

class AnalyticsSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'google_analytics' => ['required', 'string', 'starts_with:G-'],
            'analytics_property_id' => ['nullable', 'string', 'size:9'],
            'analytics_service_account_credentials' => ['nullable', new AnalyticsCredentialRule()],
        ];
    }
}
