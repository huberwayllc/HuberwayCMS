<?php

namespace HuberwayCMS\Marketplace\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class StoreRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|max:250|min:2',
            'email' => 'required|max:60|min:6|email',
            'phone' => 'required|' . BaseHelper::getPhoneValidationRule(),
            'slug' => 'required|string|max:255',
            'customer_id' => 'required|string|exists:ec_customers,id',
            'description' => 'nullable|max:400|string',
            'status' => Rule::in(BaseStatusEnum::values()),
            'company' => 'nullable|string|max:255',
            'zip_code' => 'nullable|string|max:20',
        ];
    }
}
