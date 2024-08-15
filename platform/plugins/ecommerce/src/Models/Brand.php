<?php

namespace HuberwayCMS\Ecommerce\Models;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

class Brand extends BaseModel
{
    protected $table = 'ec_brands';

    protected $fillable = [
        'name',
        'website',
        'logo',
        'description',
        'order',
        'is_featured',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
    ];

    protected static function booted(): void
    {
        self::deleted(function (Brand $brand) {
            $brand->categories()->detach();
        });
    }

    public function products(): HasMany
    {
        return $this
            ->hasMany(Product::class, 'brand_id')
            ->where('is_variation', 0)
            ->wherePublished();
    }

    public function categories(): MorphToMany
    {
        return $this->morphToMany(ProductCategory::class, 'reference', 'ec_product_categorizables', 'reference_id', 'category_id');
    }
}
