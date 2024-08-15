<?php

namespace HuberwayCMS\Ecommerce\Models;

use HuberwayCMS\Base\Casts\SafeContent;
use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Models\BaseModel;

class ProductLabel extends BaseModel
{
    protected $table = 'ec_product_labels';

    protected $fillable = [
        'name',
        'color',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];
}
