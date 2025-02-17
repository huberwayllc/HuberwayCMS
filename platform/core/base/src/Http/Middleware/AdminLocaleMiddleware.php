<?php

namespace HuberwayCMS\Base\Http\Middleware;

use HuberwayCMS\Base\Facades\AdminAppearance;
use HuberwayCMS\Base\Facades\AdminHelper;
use HuberwayCMS\Base\Supports\Language;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminLocaleMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        if (! AdminHelper::isInAdmin(true)) {
            return $next($request);
        }

        if (Auth::check()) {
            $sessionLocale = $request->session()->get('site-locale');

            $userLocale = AdminAppearance::forUser(auth()->user())->getLocale() ?: $sessionLocale;

            if (array_key_exists($userLocale, Language::getAvailableLocales())) {
                app()->setLocale($userLocale);
                $request->setLocale($userLocale);
            }
        }

        return $next($request);
    }
}
