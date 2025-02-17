<?php

namespace HuberwayCMS\Base\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Media\Facades\RvMedia;
use Illuminate\Contracts\View\Factory;
use Illuminate\Support\Facades\Auth;

class ComposerServiceProvider extends ServiceProvider
{
    public function boot(Factory $view): void
    {
        $view->composer(['core/media::config'], function () {
            $mediaPermissions = RvMedia::getConfig('permissions', []);
            if (Auth::guard()->check() && ! Auth::guard()->user()->isSuperUser() && Auth::guard()->user()->permissions) {
                $mediaPermissions = array_intersect(array_keys(Auth::guard()->user()->permissions), $mediaPermissions);
            }

            RvMedia::setPermissions($mediaPermissions);
        });
    }
}
