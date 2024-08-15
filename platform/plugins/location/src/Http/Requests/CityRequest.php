<?php

namespace HuberwayCMS\Location\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CityRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'state_id' => 'nullable|exists:states,id',
            'country_id' => 'required|exists:countries,id',
            'slug' => [
                'nullable',
                'string',
                Rule::unique('cities', 'slug')->ignore($this->route('city')),
            ],
            'image' => 'nullable|string|max:255',
            'order' => 'required|integer|min:0|max:127',
            'status' => Rule::in(BaseStatusEnum::values()),
            'is_default' => new OnOffRule(),
        ];
    }
}
