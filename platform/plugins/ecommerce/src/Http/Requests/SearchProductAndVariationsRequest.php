<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class SearchProductAndVariationsRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_ids' => 'sometimes|array',
            'keyword' => 'nullable|string|max:220',
        ];
    }
}
