<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class CreateProductWhenCreatingOrderRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:220',
            'price' => 'numeric|nullable',
        ];
    }
}
