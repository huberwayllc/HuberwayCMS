<?php

namespace HuberwayCMS\Contact\Models;

use HuberwayCMS\Base\Casts\SafeContent;
use HuberwayCMS\Base\Models\BaseModel;

class ContactReply extends BaseModel
{
    protected $table = 'contact_replies';

    protected $fillable = [
        'message',
        'contact_id',
    ];

    protected $casts = [
        'message' => SafeContent::class,
    ];
}
