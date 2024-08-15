<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class FlashSaleSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'flash_sale_enabled' => [new OnOffRule()],
        ];
    }
}
