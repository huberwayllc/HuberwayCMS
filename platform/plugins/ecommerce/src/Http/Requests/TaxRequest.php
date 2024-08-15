<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class TaxRequest extends Request
{
    public function rules(): array
    {
        return [
            'title' => 'required|string|max:255',
            'percentage' => 'required|numeric|between:0,99.99',
            'priority' => 'required|integer|min:0',
            'status' => 'required|' . Rule::in(BaseStatusEnum::values()),
        ];
    }
}
