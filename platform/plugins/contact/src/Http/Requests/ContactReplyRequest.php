<?php

namespace HuberwayCMS\Contact\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class ContactReplyRequest extends Request
{
    public function rules(): array
    {
        return [
            'message' => 'required|string|max:1500',
        ];
    }
}
