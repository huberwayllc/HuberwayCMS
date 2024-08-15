<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class UpdateOrderRequest extends Request
{
    public function rules(): array
    {
        return [
            'description' => 'nullable|string',
        ];
    }
}
