<?php

namespace HuberwayCMS\Base\Models\Concerns;

use HuberwayCMS\Base\Models\BaseQueryBuilder;

trait HasBaseEloquentBuilder
{
    public function newEloquentBuilder($query): BaseQueryBuilder
    {
        return new BaseQueryBuilder($query);
    }
}
