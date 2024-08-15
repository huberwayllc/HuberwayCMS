<?php

namespace HuberwayCMS\Location\Http\Requests;

use HuberwayCMS\Support\Http\Requests\Request;

class ChunkFileRequest extends Request
{
    public function rules(): array
    {
        return [
            'file' => ['required', 'string'],
            'offset' => ['nullable', 'integer'],
            'limit' => ['nullable', 'integer'],
        ];
    }
}
