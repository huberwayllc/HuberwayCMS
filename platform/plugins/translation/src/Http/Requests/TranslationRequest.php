<?php

namespace HuberwayCMS\Translation\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class TranslationRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
        ];
    }
}
