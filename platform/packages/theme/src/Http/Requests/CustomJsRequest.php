<?php

namespace HuberwayCMS\Theme\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class CustomJsRequest extends Request
{
    public function rules(): array
    {
        return [
            'custom_header_js' => 'nullable|string|max:2500',
            'custom_body_js' => 'nullable|string|max:2500',
            'custom_footer_js' => 'nullable|string|max:2500',
        ];
    }
}
