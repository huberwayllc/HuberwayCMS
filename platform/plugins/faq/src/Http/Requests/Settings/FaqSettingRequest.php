<?php

namespace HuberwayCMS\Faq\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;

class FaqSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'enable_faq_schema' => new OnOffRule(),
        ];
    }
}
