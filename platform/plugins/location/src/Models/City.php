<?php

namespace HuberwayCMS\Location\Models;

use HuberwayCMS\Base\Casts\SafeContent;
use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Base\Models\Concerns\HasSlug;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class City extends BaseModel
{
    use HasSlug;

    protected $table = 'cities';

    protected $fillable = [
        'name',
        'state_id',
        'country_id',
        'record_id',
        'slug',
        'image',
        'order',
        'is_default',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'is_default' => 'bool',
        'order' => 'int',
    ];

    protected static function booted(): void
    {
        self::saving(function (self $model) {
            $model->slug = self::createSlug($model->slug ?: $model->name, $model->getKey());
        });
    }

    public function state(): BelongsTo
    {
        return $this->belongsTo(State::class)->withDefault();
    }

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class)->withDefault();
    }
}
