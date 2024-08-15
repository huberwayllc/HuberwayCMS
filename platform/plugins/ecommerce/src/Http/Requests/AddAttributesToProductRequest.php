<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class AddAttributesToProductRequest extends Request
{
    public function rules(): array
    {
        return [
            'added_attributes' => 'sometimes|array',
            'added_attribute_sets' => 'sometimes|array',
        ];
    }
}
