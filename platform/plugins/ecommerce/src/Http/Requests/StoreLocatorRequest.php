<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class StoreLocatorRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:220',
            'email' => 'email|nullable|max:60',
            'phone' => 'required|' . BaseHelper::getPhoneValidationRule(),
            'country' => 'required|max:120',
            'state' => 'required|max:120',
            'city' => 'required|max:120',
            'address' => 'required|max:120',
            'is_shipping_location' => [new OnOffRule()],
        ];
    }
}
