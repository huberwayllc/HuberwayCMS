<?php

namespace Theme\HuberwayTheme\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class SendDownloadAppLinksRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => 'required|email',
        ];
    }
}
