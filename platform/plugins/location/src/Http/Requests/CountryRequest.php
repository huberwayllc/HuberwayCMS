<?php

namespace HuberwayCMS\Location\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CountryRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'code' => 'nullable|string|max:120',
            'nationality' => 'nullable|string|max:120',
            'order' => 'required|integer|min:0|max:127',
            'status' => Rule::in(BaseStatusEnum::values()),
            'is_default' => new OnOffRule(),
        ];
    }
}
