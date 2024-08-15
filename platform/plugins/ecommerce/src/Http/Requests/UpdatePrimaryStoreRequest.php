<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class UpdatePrimaryStoreRequest extends Request
{
    public function rules(): array
    {
        return [
            'primary_store_id' => 'required|numeric',
        ];
    }
}
