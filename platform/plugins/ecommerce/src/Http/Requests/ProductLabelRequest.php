<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductLabelRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'color' => 'required|string',
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
