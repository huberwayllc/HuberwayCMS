<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use Illuminate\Support\Arr;

class SaveCheckoutInformationRequest extends CheckoutRequest
{
    public function rules(): array
    {
        $rules = parent::rules();

        Arr::forget($rules, ['payment_method', 'shipping_method', 'shipping_option', 'amount']);

        foreach ($rules as $key => $rule) {
            if (str_contains($key, 'shipping_method.') || str_contains($key, 'shipping_option.')) {
                unset($rules[$key]);
            }
        }

        return $rules;
    }
}
