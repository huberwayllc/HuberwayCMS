<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Fronts\Auth;

use HuberwayCMS\Base\Rules\EmailRule;
use HuberwayCMS\Support\Http\Requests\Request;

class ForgotPasswordRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => ['required', new EmailRule()],
        ];
    }
}
