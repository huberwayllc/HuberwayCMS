<?php

namespace HuberwayCMS\Marketplace\Http\Requests\Fronts;

use HuberwayCMS\Support\Http\Requests\Request;

class VendorEditWithdrawalRequest extends Request
{
    public function rules(): array
    {
        return [
            'description' => 'nullable|max:400',
        ];
    }
}
