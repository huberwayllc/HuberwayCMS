<?php

namespace HuberwayCMS\Ecommerce\Models;

use HuberwayCMS\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class OrderReferral extends BaseModel
{
    protected $table = 'ec_order_referrals';

    protected $fillable = [
        'ip',
        'landing_domain',
        'landing_page',
        'landing_params',
        'referral',
        'gclid',
        'fclid',
        'utm_source',
        'utm_campaign',
        'utm_medium',
        'utm_term',
        'utm_content',
        'referrer_url',
        'referrer_domain',
        'order_id',
    ];

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class)->withDefault();
    }
}
