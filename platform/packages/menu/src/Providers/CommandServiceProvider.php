<?php

namespace HuberwayCMS\Menu\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Menu\Commands\ClearMenuCacheCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ClearMenuCacheCommand::class,
        ]);
    }
}
