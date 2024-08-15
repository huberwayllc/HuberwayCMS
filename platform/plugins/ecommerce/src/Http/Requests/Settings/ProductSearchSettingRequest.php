<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class ProductSearchSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'search_for_an_exact_phrase' => $onOffRule = new OnOffRule(),
            'search_products_by' => ['required', 'array'],
            'search_products_by.*' => ['required', 'in:name,sku,variation_sku,description,brand,tag'],
            'enable_filter_products_by_brands' => $onOffRule,
            'enable_filter_products_by_tags' => $onOffRule,
            'enable_filter_products_by_attributes' => $onOffRule,
        ];
    }
}
