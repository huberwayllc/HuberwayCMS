<?php

namespace HuberwayCMS\PayPal\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class PayPalPaymentCallbackRequest extends Request
{
    public function rules(): array
    {
        return [
            'amount' => 'required|numeric',
            'currency' => 'required',
        ];
    }
}
