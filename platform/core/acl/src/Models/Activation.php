<?php

namespace HuberwayCMS\ACL\Models;

use HuberwayCMS\Base\Models\BaseModel;

class Activation extends BaseModel
{
    protected $table = 'activations';

    protected $fillable = [
        'code',
        'completed',
        'completed_at',
    ];

    protected $casts = [
        'completed' => 'bool',
    ];
}
