<?php

namespace HuberwayCMS\Base\Casts;

use HuberwayCMS\Base\Facades\BaseHelper;
use Illuminate\Contracts\Database\Eloquent\CastsAttributes;

class SafeContent implements CastsAttributes
{
    public function set($model, string $key, $value, array $attributes)
    {
        return BaseHelper::clean($value);
    }

    public function get($model, string $key, $value, array $attributes)
    {
        return html_entity_decode(BaseHelper::clean($value));
    }
}
