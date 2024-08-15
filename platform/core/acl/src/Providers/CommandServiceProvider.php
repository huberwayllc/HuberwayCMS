<?php

namespace HuberwayCMS\ACL\Providers;

use HuberwayCMS\ACL\Commands\UserCreateCommand;
use HuberwayCMS\Base\Supports\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            UserCreateCommand::class,
        ]);
    }
}
