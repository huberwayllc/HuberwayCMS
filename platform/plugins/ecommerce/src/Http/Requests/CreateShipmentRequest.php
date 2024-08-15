<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class CreateShipmentRequest extends Request
{
    public function rules(): array
    {
        return [
            'method' => 'required|string',
        ];
    }
}
