<?php

namespace HuberwayCMS\Ecommerce\Models;

use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ReviewReply extends BaseModel
{
    protected $table = 'ec_review_replies';

    protected $fillable = [
        'review_id',
        'user_id',
        'message',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function review(): BelongsTo
    {
        return $this->belongsTo(Review::class);
    }
}
