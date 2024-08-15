<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Fronts;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Rules\EmailRule;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Support\Http\Requests\Request;

class OrderTrackingRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'order_id' => ['nullable', 'string', 'min:1'],
            'email' => ['nullable', new EmailRule()],
        ];

        if (EcommerceHelper::isLoginUsingPhone()) {
            $rules['phone'] = 'nullable|' . BaseHelper::getPhoneValidationRule();
        }

        return $rules;
    }
}
