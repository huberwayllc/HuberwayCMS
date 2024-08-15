<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Enums\GlobalOptionEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductOptionRequest extends Request
{
    public function rules(): array
    {
        return [
            'option_name' => 'required|string',
            'option_type' => [
                Rule::requiredIf(fn () => $this->input('option_type') == GlobalOptionEnum::NA),
            ],
        ];
    }
}
