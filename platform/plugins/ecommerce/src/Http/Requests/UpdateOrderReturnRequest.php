<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Enums\OrderReturnStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateOrderReturnRequest extends Request
{
    public function rules(): array
    {
        return [
            'return_status' => 'required|string|' . Rule::in(OrderReturnStatusEnum::values()),
        ];
    }
}
