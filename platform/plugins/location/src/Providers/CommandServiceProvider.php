<?php

namespace HuberwayCMS\Location\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Location\Commands\MigrateLocationCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            MigrateLocationCommand::class,
        ]);
    }
}
