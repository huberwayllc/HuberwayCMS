<?php

namespace HuberwayCMS\ACL\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class LoginRequest extends Request
{
    public function rules(): array
    {
        return [
            'username' => 'required|string|min:4|max:30',
            'password' => 'required|string|min:6|max:60',
        ];
    }
}
