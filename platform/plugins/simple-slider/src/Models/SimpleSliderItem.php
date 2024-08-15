<?php

namespace HuberwayCMS\SimpleSlider\Models;

use HuberwayCMS\Base\Casts\SafeContent;
use HuberwayCMS\Base\Models\BaseModel;

class SimpleSliderItem extends BaseModel
{
    protected $table = 'simple_slider_items';

    protected $fillable = [
        'title',
        'description',
        'link',
        'image',
        'order',
        'simple_slider_id',
    ];

    protected $casts = [
        'title' => SafeContent::class,
        'description' => SafeContent::class,
        'link' => SafeContent::class,
    ];

    protected static function booted(): void
    {
        static::deleted(function (SimpleSliderItem $item) {
            $item->metadata()->delete();
        });
    }
}
