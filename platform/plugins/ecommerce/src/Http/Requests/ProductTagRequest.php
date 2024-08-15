<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductTagRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'description' => 'nullable|string|max:400',
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
