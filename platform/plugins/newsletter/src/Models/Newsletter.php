<?php

namespace HuberwayCMS\Newsletter\Models;

use HuberwayCMS\Base\Casts\SafeContent;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Newsletter\Enums\NewsletterStatusEnum;

class Newsletter extends BaseModel
{
    protected $table = 'newsletters';

    protected $fillable = [
        'email',
        'name',
        'status',
    ];

    protected $casts = [
        'name' => SafeContent::class,
        'status' => NewsletterStatusEnum::class,
    ];
}
