<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Fronts;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Support\Http\Requests\Request;

class ReviewRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_id' => 'required|exists:ec_products,id',
            'star' => 'required|numeric|min:1|max:5',
            'comment' => 'required|string|max:5000',
            'images' => 'array|max:' . EcommerceHelper::reviewMaxFileNumber(),
            'images.*' => 'image|mimes:jpg,jpeg,png|max:' . EcommerceHelper::reviewMaxFileSize(true),
        ];
    }
}
