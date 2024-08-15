<?php

namespace HuberwayCMS\SimpleSlider\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class SimpleSliderRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
            'key' => 'required|string|max:120',
            'description' => 'nullable|string|max:1000',
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
