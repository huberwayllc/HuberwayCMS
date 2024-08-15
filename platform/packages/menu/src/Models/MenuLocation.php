<?php

namespace HuberwayCMS\Menu\Models;

use HuberwayCMS\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class MenuLocation extends BaseModel
{
    protected $table = 'menu_locations';

    protected $fillable = [
        'menu_id',
        'location',
    ];

    public function menu(): BelongsTo
    {
        return $this->belongsTo(Menu::class, 'menu_id')->withDefault();
    }
}
