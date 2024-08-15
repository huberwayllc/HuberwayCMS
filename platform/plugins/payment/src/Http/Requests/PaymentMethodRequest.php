<?php

namespace HuberwayCMS\Payment\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class PaymentMethodRequest extends Request
{
    public function rules(): array
    {
        return [
            'type' => 'required|string|max:120',
        ];
    }
}
