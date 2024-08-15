<?php

namespace HuberwayCMS\Base\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ClearCacheRequest extends Request
{
    public function rules(): array
    {
        return [
            'type' => ['required', 'string', Rule::in([
                'clear_cms_cache',
                'refresh_compiled_views',
                'clear_config_cache',
                'clear_route_cache',
                'clear_log',
            ])],
        ];
    }
}
