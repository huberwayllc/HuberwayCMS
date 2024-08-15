<?php

namespace HuberwayCMS\AuditLog\Providers;

use HuberwayCMS\AuditLog\Commands\ActivityLogClearCommand;
use HuberwayCMS\AuditLog\Commands\CleanOldLogsCommand;
use HuberwayCMS\Base\Supports\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ActivityLogClearCommand::class,
            CleanOldLogsCommand::class,
        ]);
    }
}
