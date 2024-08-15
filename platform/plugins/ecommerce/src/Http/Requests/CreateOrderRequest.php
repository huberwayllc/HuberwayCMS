<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Payment\Enums\PaymentStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CreateOrderRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'customer_id' => 'required|exists:ec_customers,id',
        ];

        $products = Product::query()
            ->whereIn('id', collect($this->input('products'))->pluck('id')->all())
            ->get();

        if (EcommerceHelper::isAvailableShipping($products)) {
            $rules['customer_address.phone'] = 'required|' . BaseHelper::getPhoneValidationRule();
        }

        if (is_plugin_active('payment')) {
            $rules['payment_status'] = Rule::in([PaymentStatusEnum::COMPLETED, PaymentStatusEnum::PENDING]);
        }

        return $rules;
    }

    public function attributes(): array
    {
        return [
            'customer_id' => trans('plugins/ecommerce::order.customer_label'),
            'customer_address.phone' => trans('plugins/ecommerce::order.phone'),
        ];
    }
}
