<?php

namespace HuberwayCMS\Ecommerce\Services\Products;

use HuberwayCMS\Ecommerce\Models\Product;
use Closure;

class ProductDiscountPriceService extends ProductPriceHandlerService
{
    public function handle(Product $product, Closure $next)
    {
        $finalPrice = $product->getFinalPrice();
        $discountPrice = $product->getDiscountPrice();

        if ($discountPrice < $finalPrice) {
            $product->setFinalPrice($discountPrice);
        }

        return $next($product);
    }
}
