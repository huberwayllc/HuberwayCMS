<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class TrackingSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'facebook_pixel_enabled' => $onOffRule = new OnOffRule(),
            'facebook_pixel_id' => ['nullable', 'required_if:facebook_pixel_enabled,1', 'string', 'max:120'],
            'google_tag_manager_enabled' => $onOffRule,
            'google_tag_manager_code' => ['nullable', 'required_if:google_tag_manager_enabled,1', 'string', 'max:400'],
        ];
    }
}
