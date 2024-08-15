<?php

namespace HuberwayCMS\Backup\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class BackupRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:250',
        ];
    }
}
