<?php

namespace HuberwayCMS\Marketplace\Models;

use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Ecommerce\Models\ProductCategory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class CategoryCommission extends BaseModel
{
    protected $table = 'mp_category_sale_commissions';

    protected $fillable = [
        'product_category_id',
        'commission_percentage',
    ];

    public $timestamps = false;

    public function category(): BelongsTo
    {
        return $this->belongsTo(ProductCategory::class, 'product_category_id');
    }
}
