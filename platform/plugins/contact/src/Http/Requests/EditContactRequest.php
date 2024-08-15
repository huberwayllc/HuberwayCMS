<?php

namespace HuberwayCMS\Contact\Http\Requests;

use HuberwayCMS\Contact\Enums\ContactStatusEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class EditContactRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => Rule::in(ContactStatusEnum::values()),
        ];
    }
}
