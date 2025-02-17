<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class CustomerUpdateEmailRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => 'required|max:60|min:6|email|unique:ec_customers,email,' . $this->route('id'),
        ];
    }
}
