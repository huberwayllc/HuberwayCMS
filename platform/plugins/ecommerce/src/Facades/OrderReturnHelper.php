<?php

namespace HuberwayCMS\Ecommerce\Facades;

use HuberwayCMS\Ecommerce\Supports\OrderReturnHelper as BaseOrderReturnHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static array returnOrder(\HuberwayCMS\Ecommerce\Models\Order $order, array $data)
 * @method static array cancelReturnOrder(\HuberwayCMS\Ecommerce\Models\OrderReturn $orderReturn)
 * @method static array updateReturnOrder(\HuberwayCMS\Ecommerce\Models\OrderReturn $orderReturn, array $data)
 *
 * @see \HuberwayCMS\Ecommerce\Supports\OrderReturnHelper
 */
class OrderReturnHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseOrderReturnHelper::class;
    }
}
