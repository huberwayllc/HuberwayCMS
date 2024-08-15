<?php

namespace HuberwayCMS\Optimize\Facades;

use HuberwayCMS\Optimize\Supports\Optimizer;
use Illuminate\Support\Facades\Facade;

/**
 * @method static bool isEnabled()
 * @method static \HuberwayCMS\Optimize\Supports\Optimizer enable()
 * @method static \HuberwayCMS\Optimize\Supports\Optimizer disable()
 *
 * @see \HuberwayCMS\Optimize\Supports\Optimizer
 */
class OptimizerHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return Optimizer::class;
    }
}
