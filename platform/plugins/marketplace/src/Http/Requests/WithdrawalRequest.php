<?php

namespace HuberwayCMS\Marketplace\Http\Requests;

use HuberwayCMS\Marketplace\Enums\PayoutPaymentMethodsEnum;
use HuberwayCMS\Marketplace\Enums\WithdrawalStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class WithdrawalRequest extends Request
{
    public function rules(): array
    {
        return [
            'images' => 'nullable|array',
            'status' => Rule::in(WithdrawalStatusEnum::values()),
            'description' => 'nullable|max:400',
            'payment_channel' => Rule::in(array_keys(PayoutPaymentMethodsEnum::payoutMethodsEnabled())),
        ];
    }
}
