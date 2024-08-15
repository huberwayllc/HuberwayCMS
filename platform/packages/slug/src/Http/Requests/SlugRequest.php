<?php

namespace HuberwayCMS\Slug\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class SlugRequest extends Request
{
    public function rules(): array
    {
        return [
            'value' => 'required|string',
            'slug_id' => 'required|string',
            'model' => 'nullable|string',
        ];
    }
}
