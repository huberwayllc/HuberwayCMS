<?php

namespace HuberwayCMS\Faq\Http\Requests;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class FaqRequest extends Request
{
    public function rules(): array
    {
        return [
            'category_id' => ['required', 'exists:faq_categories,id'],
            'question' => ['required', 'string'],
            'answer' => ['required', 'string'],
            'status' => ['required', Rule::in(BaseStatusEnum::values())],
        ];
    }
}
