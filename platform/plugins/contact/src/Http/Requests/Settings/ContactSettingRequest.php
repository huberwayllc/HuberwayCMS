<?php

namespace HuberwayCMS\Contact\Http\Requests\Settings;

use HuberwayCMS\Support\Http\Requests\Request;

class ContactSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'blacklist_keywords' => ['nullable', 'string'],
        ];
    }
}
