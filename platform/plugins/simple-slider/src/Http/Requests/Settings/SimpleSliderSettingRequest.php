<?php

namespace HuberwayCMS\SimpleSlider\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class SimpleSliderSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'simple_slider_using_assets' => new OnOffRule(),
        ];
    }
}
