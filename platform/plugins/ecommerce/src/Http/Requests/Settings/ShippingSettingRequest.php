<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class ShippingSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'hide_other_shipping_options_if_it_has_free_shipping' => new OnOffRule(),
        ];
    }
}
