<?php

namespace HuberwayCMS\Base\Models;

use HuberwayCMS\Base\Contracts\BaseModel as BaseModelContract;
use HuberwayCMS\Base\Facades\MacroableModels;
use HuberwayCMS\Base\Models\Concerns\HasBaseEloquentBuilder;
use HuberwayCMS\Base\Models\Concerns\HasMetadata;
use HuberwayCMS\Base\Models\Concerns\HasUuidsOrIntegerIds;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

/**
 * @method static \HuberwayCMS\Base\Models\BaseQueryBuilder query()
 */
class BaseModel extends Model implements BaseModelContract
{
    use HasBaseEloquentBuilder;
    use HasMetadata;
    use HasUuidsOrIntegerIds;

    public function __get($key)
    {
        if (MacroableModels::modelHasMacro($this::class, $method = 'get' . Str::studly($key) . 'Attribute')) {
            return call_user_func([$this, $method]);
        }

        return parent::__get($key);
    }
}
