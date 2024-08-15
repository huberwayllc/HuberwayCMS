<?php

namespace HuberwayCMS\Setting\Models;

use HuberwayCMS\Base\Models\BaseModel;

class Setting extends BaseModel
{
    protected $table = 'settings';

    protected $fillable = [
        'key',
        'value',
    ];
}
