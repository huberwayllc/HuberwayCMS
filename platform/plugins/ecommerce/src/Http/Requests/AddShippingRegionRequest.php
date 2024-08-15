<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class AddShippingRegionRequest extends Request
{
    public function rules(): array
    {
        return [
            'region' => ['nullable', 'string', Rule::in(array_keys(EcommerceHelper::getAvailableCountries()))],
        ];
    }
}
