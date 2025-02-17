<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductCategoryRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'description' => 'nullable|string|max:100000',
            'image' => ['nullable', 'string', 'max:255'],
            'icon' => ['nullable', 'string', 'max:50'],
            'icon_image' => ['nullable', 'string', 'max:255'],
            'is_featured' => 'sometimes|boolean',
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
