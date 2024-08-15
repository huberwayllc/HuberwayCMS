<?php

namespace HuberwayCMS\ACL\Http\Requests;

use HuberwayCMS\Base\Rules\EmailRule;
use HuberwayCMS\Support\Http\Requests\Request;

class ResetPasswordRequest extends Request
{
    public function rules(): array
    {
        return [
            'token' => ['required', 'string'],
            'email' => ['required', new EmailRule()],
            'password' => ['required', 'confirmed', 'min:6'],
        ];
    }
}
