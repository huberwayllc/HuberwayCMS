<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Support\Http\Requests\Request;

class AddCustomerWhenCreateOrderRequest extends Request
{
    public function rules(): array
    {
        if (! EcommerceHelper::isUsingInMultipleCountries()) {
            $this->merge(['country' => EcommerceHelper::getFirstCountryId()]);
        }

        $rules = EcommerceHelper::getCustomerAddressValidationRules();
        $rules['email'] = 'required|max:60|min:6|email|unique:ec_customers';

        return $rules;
    }
}
