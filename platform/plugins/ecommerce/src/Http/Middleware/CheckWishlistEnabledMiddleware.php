<?php

namespace HuberwayCMS\Ecommerce\Http\Middleware;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use Closure;
use Illuminate\Http\Request;

class CheckWishlistEnabledMiddleware
{
    public function handle(Request $request, Closure $closure)
    {
        if (! EcommerceHelper::isWishlistEnabled()) {
            abort(404);
        }

        return $closure($request);
    }
}
