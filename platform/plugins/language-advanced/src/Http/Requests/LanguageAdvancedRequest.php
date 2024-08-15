<?php

namespace HuberwayCMS\LanguageAdvanced\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class LanguageAdvancedRequest extends Request
{
    public function rules(): array
    {
        return [
            'model' => 'required|string|max:255',
        ];
    }
}
