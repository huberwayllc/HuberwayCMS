<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductAttributeSetsRequest extends Request
{
    public function rules(): array
    {
        return [
            'title' => 'required|string|max:255',
            'description' => 'max:400|nullable|string',
            'order' => 'required|integer|min:0|max:127',
            'status' => Rule::in(BaseStatusEnum::values()),
            'attributes' => 'nullable|string',
            'deleted_attributes' => 'nullable|string',
            'display_layout' => 'required|string|in:dropdown,text,visual',
            'categories' => 'nullable|array',
        ];
    }
}
