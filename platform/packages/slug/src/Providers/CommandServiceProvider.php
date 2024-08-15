<?php

namespace HuberwayCMS\Slug\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Slug\Commands\ChangeSlugPrefixCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ChangeSlugPrefixCommand::class,
        ]);
    }
}
