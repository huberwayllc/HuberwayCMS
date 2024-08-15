<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Enums\ShippingCodStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateShipmentCodStatusRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => 'required|' . Rule::in(ShippingCodStatusEnum::values()),
        ];
    }
}
