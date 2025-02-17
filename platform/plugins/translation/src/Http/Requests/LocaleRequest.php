<?php

namespace HuberwayCMS\Translation\Http\Requests;

use HuberwayCMS\Base\Supports\Language;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class LocaleRequest extends Request
{
    public function rules(): array
    {
        return [
            'locale' => ['required', Rule::in(Language::getLocaleKeys())],
        ];
    }
}
