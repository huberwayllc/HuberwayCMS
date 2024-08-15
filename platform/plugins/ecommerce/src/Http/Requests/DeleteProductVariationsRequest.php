<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class DeleteProductVariationsRequest extends Request
{
    public function rules(): array
    {
        return [
            'ids' => 'sometimes|array',
            'ids.*' => 'required',
        ];
    }
}
