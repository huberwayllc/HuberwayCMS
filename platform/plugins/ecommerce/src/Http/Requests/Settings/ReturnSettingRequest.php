<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class ReturnSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'is_enabled_order_return' => $onOffRule = new  OnOffRule(),
            'can_custom_return_product_quantity' => $onOffRule,
            'returnable_days' => ['nullable', 'integer', 'min:1'],
        ];
    }
}
