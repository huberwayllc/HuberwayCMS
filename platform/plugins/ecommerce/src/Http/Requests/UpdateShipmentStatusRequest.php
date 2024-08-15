<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Enums\ShippingStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateShipmentStatusRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => 'required|' . Rule::in(ShippingStatusEnum::values()),
        ];
    }
}
