<?php

namespace HuberwayCMS\Setting\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class EmailSendTestRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => ['required', 'email'],
        ];
    }
}
