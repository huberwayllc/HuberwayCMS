<?php

namespace HuberwayCMS\Ecommerce\Facades;

use HuberwayCMS\Ecommerce\Supports\FlashSaleSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \HuberwayCMS\Ecommerce\Models\Product|null flashSaleForProduct(\HuberwayCMS\Ecommerce\Models\Product $product)
 * @method static \Illuminate\Support\Collection getAvailableFlashSales()
 * @method static bool isEnabled()
 * @method static bool isShowSaleCountLeft()
 * @method static void addShowSaleCountLeftSetting()
 *
 * @see \HuberwayCMS\Ecommerce\Supports\FlashSaleSupport
 */
class FlashSale extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return FlashSaleSupport::class;
    }
}
