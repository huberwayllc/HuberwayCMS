<?php

namespace HuberwayCMS\Marketplace\Models;

use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Ecommerce\Models\Currency;
use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Ecommerce\Models\Order;
use HuberwayCMS\Marketplace\Enums\RevenueTypeEnum;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Revenue extends BaseModel
{
    protected $table = 'mp_customer_revenues';

    protected $fillable = [
        'customer_id',
        'order_id',
        'sub_amount',
        'fee',
        'amount',
        'current_balance',
        'currency',
        'description',
        'user_id',
        'type',
    ];

    protected $casts = [
        'type' => RevenueTypeEnum::class,
    ];

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class)->withDefault();
    }

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class)->withDefault();
    }

    public function currencyRelation(): BelongsTo
    {
        return $this->belongsTo(Currency::class, 'currency', 'title')->withDefault();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class)->withDefault();
    }

    public function getDescriptionTooltipAttribute(): string
    {
        if (! $this->description) {
            return '';
        }

        return Html::tag('span', '<i class="fa fa-info-circle text-info"></i>', [
            'class' => 'ms-1',
            'data-bs-toggle' => 'tooltip',
            'data-bs-original-title' => $this->description,
            'title' => $this->description,
        ]);
    }
}
