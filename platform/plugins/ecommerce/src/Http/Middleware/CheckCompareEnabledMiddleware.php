<?php

namespace HuberwayCMS\Ecommerce\Http\Middleware;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use Closure;
use Illuminate\Http\Request;

class CheckCompareEnabledMiddleware
{
    public function handle(Request $request, Closure $closure)
    {
        if (! EcommerceHelper::isCompareEnabled()) {
            abort(404);
        }

        return $closure($request);
    }
}
