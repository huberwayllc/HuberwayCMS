<?php

namespace HuberwayCMS\SimpleSlider\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class SimpleSliderItemRequest extends Request
{
    public function rules(): array
    {
        return [
            'simple_slider_id' => 'required|string',
            'title' => 'nullable|string|max:255',
            'image' => 'required|string',
            'order' => 'required|integer|min:0|max:1000',
        ];
    }
}
