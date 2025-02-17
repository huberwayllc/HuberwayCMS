<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class DigitalProductSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'is_enabled_support_digital_products' => $onOffRule = new OnOffRule(),
            'allow_guest_checkout_for_digital_products' => $onOffRule,
            'enable_filter_products_by_brands' => $onOffRule,
            'enable_filter_products_by_tags' => $onOffRule,
            'enable_filter_products_by_attributes' => $onOffRule,
        ];
    }
}
