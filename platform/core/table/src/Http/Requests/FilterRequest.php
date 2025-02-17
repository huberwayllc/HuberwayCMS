<?php

namespace HuberwayCMS\Table\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class FilterRequest extends Request
{
    public function rules(): array
    {
        return [
            'key' => ['nullable', 'string'],
            'value' => ['nullable', 'string'],
            'class' => ['required', 'string'],
        ];
    }
}
