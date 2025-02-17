<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Rules\MediaImageRule;
use HuberwayCMS\Support\Http\Requests\Request;

class ReviewRequest extends Request
{
    protected function prepareForValidation(): void
    {
        $this->merge([
            'images' => array_filter($this->input('images', []) ?? []),
        ]);
    }

    public function rules(): array
    {
        return [
            'created_at' => ['required', 'date'],
            'product_id' => ['required', 'exists:ec_products,id'],
            'customer_id' => ['required', 'exists:ec_customers,id'],
            'star' => ['required', 'integer', 'min:1', 'max:5'],
            'comment' => ['required', 'string', 'max:5000'],
            'images' => ['nullable', 'array'],
            'images.*' => ['nullable', new MediaImageRule()],
        ];
    }
}
