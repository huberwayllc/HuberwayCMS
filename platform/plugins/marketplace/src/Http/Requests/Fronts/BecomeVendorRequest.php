<?php

namespace HuberwayCMS\Marketplace\Http\Requests\Fronts;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Support\Http\Requests\Request;

class BecomeVendorRequest extends Request
{
    public function rules(): array
    {
        return [
            'shop_name' => 'required|min:2',
            'shop_phone' => 'required|' . BaseHelper::getPhoneValidationRule(),
            'shop_url' => 'required|max:200',
        ];
    }
}
