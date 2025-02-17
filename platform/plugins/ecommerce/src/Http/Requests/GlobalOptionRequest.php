<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Enums\GlobalOptionEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class GlobalOptionRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'options' => 'nullable',
            'options.*.option_value' => 'nullable|string',
            'options.*.affect_price' => 'nullable|numeric',
            'options.*.affect_type' => 'nullable|integer',
            'option_type' => [
                Rule::requiredIf(fn () => $this->input('option_type') == GlobalOptionEnum::NA),
            ],
            'required' => 'boolean',
        ];
    }
}
