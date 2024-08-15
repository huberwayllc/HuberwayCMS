<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Fronts\Auth;

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
