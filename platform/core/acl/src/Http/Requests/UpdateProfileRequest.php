<?php

namespace HuberwayCMS\ACL\Http\Requests;

use HuberwayCMS\Base\Rules\EmailRule;
use HuberwayCMS\Support\Http\Requests\Request;

class UpdateProfileRequest extends Request
{
    public function rules(): array
    {
        return [
            'username' => ['required', 'string', 'alpha_dash', 'min:4', 'max:30'],
            'first_name' => ['required', 'string', 'max:60', 'min:2'],
            'last_name' => ['required', 'string', 'max:60', 'min:2'],
            'email' => ['required', 'max:60', 'min:6', new EmailRule()],
        ];
    }
}
