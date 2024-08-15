<?php

namespace HuberwayCMS\Payment\Http\Requests\Settings;

use HuberwayCMS\Payment\Enums\PaymentMethodEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PaymentMethodSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'default_payment_method' => ['required', Rule::in(PaymentMethodEnum::values())],
        ];
    }
}
