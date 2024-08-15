<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Media\Facades\RvMedia;
use HuberwayCMS\Support\Http\Requests\Request;

class AvatarRequest extends Request
{
    public function rules(): array
    {
        return [
            'avatar_file' => RvMedia::imageValidationRule(),
        ];
    }
}
