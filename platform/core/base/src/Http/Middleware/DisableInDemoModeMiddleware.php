<?php

namespace HuberwayCMS\Base\Http\Middleware;

use HuberwayCMS\Base\Exceptions\DisabledInDemoModeException;
use HuberwayCMS\Base\Facades\BaseHelper;
use Closure;
use Illuminate\Http\Request;

class DisableInDemoModeMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        if (BaseHelper::hasDemoModeEnabled()) {
            throw new DisabledInDemoModeException();
        }

        return $next($request);
    }
}
