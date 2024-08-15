<?php

namespace HuberwayCMS\Payment\Http\Requests;

use HuberwayCMS\Payment\Enums\PaymentStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdatePaymentRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => Rule::in(PaymentStatusEnum::values()),
        ];
    }
}
