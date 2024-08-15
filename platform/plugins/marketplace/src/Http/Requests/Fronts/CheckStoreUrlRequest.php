<?php

namespace HuberwayCMS\Marketplace\Http\Requests\Fronts;

use HuberwayCMS\Support\Http\Requests\Request;

class CheckStoreUrlRequest extends Request
{
    public function rules(): array
    {
        return [
            'url' => 'required|max:200',
        ];
    }
}
