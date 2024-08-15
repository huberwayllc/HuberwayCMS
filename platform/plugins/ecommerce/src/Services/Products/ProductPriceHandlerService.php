<?php

namespace HuberwayCMS\Ecommerce\Services\Products;

use HuberwayCMS\Ecommerce\Models\Product;
use Closure;

abstract class ProductPriceHandlerService
{
    public function handle(Product $product, Closure $next)
    {
        return $next($product);
    }
}
