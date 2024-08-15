<?php

namespace HuberwayCMS\Stripe\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class StripePaymentCallbackRequest extends Request
{
    public function rules(): array
    {
        return [
            'session_id' => 'required|size:66',
        ];
    }
}
