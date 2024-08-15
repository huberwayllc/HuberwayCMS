<?php

namespace HuberwayCMS\Ecommerce\Facades;

use HuberwayCMS\Ecommerce\Supports\DiscountSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \HuberwayCMS\Ecommerce\Supports\DiscountSupport setCustomerId(string|int $customerId)
 * @method static string|int getCustomerId()
 * @method static \HuberwayCMS\Ecommerce\Models\Discount|null promotionForProduct(array $productIds)
 * @method static \Illuminate\Support\Collection getAvailablePromotions(bool $forProductSingle = true)
 * @method static void afterOrderPlaced(string $couponCode, string|int|null $customerId = 0)
 * @method static void afterOrderCancelled(string $couponCode, string|int|null $customerId = 0)
 *
 * @see \HuberwayCMS\Ecommerce\Supports\DiscountSupport
 */
class Discount extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return DiscountSupport::class;
    }
}
