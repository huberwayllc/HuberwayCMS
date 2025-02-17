<?php

namespace HuberwayCMS\Ecommerce\Models;

use HuberwayCMS\Base\Casts\SafeContent;
use HuberwayCMS\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class InvoiceItem extends BaseModel
{
    protected $table = 'ec_invoice_items';

    protected $fillable = [
        'invoice_id',
        'reference_type',
        'reference_id',
        'name',
        'description',
        'image',
        'qty',
        'price',
        'sub_total',
        'tax_amount',
        'discount_amount',
        'amount',
        'metadata',
        'options',
    ];

    protected $casts = [
        'sub_total' => 'float',
        'tax_amount' => 'float',
        'discount_amount' => 'float',
        'amount' => 'float',
        'metadata' => 'json',
        'paid_at' => 'datetime',
        'options' => 'json',
        'name' => SafeContent::class,
    ];

    public function invoice(): BelongsTo
    {
        return $this->belongsTo(Invoice::class);
    }

    public function reference(): MorphTo
    {
        return $this->morphTo();
    }

    protected function amountFormat(): Attribute
    {
        return Attribute::get(fn () => format_price($this->price));
    }

    protected function totalFormat(): Attribute
    {
        return Attribute::get(fn () => format_price($this->price * $this->qty));
    }
}
