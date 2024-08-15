<?php

namespace HuberwayCMS\Marketplace\Http\Requests\Fronts;

use HuberwayCMS\Ecommerce\Enums\ShippingStatusEnum;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateShippingStatusRequest extends Request
{
    public function rules(): array
    {
        if (MarketplaceHelper::allowVendorManageShipping()) {
            return [
                'status' => Rule::in(ShippingStatusEnum::values()),
            ];
        }

        return [
            'status' => Rule::in([ShippingStatusEnum::ARRANGE_SHIPMENT, ShippingStatusEnum::READY_TO_BE_SHIPPED_OUT]),
        ];
    }
}
