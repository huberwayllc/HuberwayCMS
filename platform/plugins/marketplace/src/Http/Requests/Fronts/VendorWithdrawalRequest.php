<?php

namespace HuberwayCMS\Marketplace\Http\Requests\Fronts;

use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Support\Http\Requests\Request;

class VendorWithdrawalRequest extends Request
{
    public function rules(): array
    {
        $maximum = auth('customer')->user()->balance - MarketplaceHelper::getSetting('fee_withdrawal', 0);

        return [
            'amount' => ['required', 'numeric', 'min:0', "max:{$maximum}"],
            'description' => ['nullable', 'max:400'],
        ];
    }

    public function messages(): array
    {
        return [
            'amount.max' => __('The balance is not enough for withdrawal'),
        ];
    }
}
