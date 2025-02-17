<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class BrandRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'slug' => 'nullable|string|max:250',
            'description' => 'nullable|string|max:400',
            'order' => 'required|integer|min:0|max:127',
            'website' => 'nullable|string',
            'status' => Rule::in(BaseStatusEnum::values()),
            'categories' => 'nullable|array',
        ];
    }

    public function attributes(): array
    {
        return [
            'categories.*' => trans('plugins/ecommerce::products.form.categories'),
        ];
    }
}
