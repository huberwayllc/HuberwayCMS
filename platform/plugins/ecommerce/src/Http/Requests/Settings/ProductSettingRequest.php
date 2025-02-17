<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class ProductSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'how_to_display_product_variation_images' => 'in:only_variation_images,variation_images_and_main_product_images',
            'show_number_of_products' => $onOffRule = new OnOffRule(),
            'show_out_of_stock_products' => $onOffRule,
            'is_enabled_product_options' => $onOffRule,
            'auto_generate_product_sku' => $onOffRule,
            'product_sku_format' => ['nullable', 'string', 'max:120'],
        ];
    }
}
