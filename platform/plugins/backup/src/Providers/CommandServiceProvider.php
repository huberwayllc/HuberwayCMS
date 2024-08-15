<?php

namespace HuberwayCMS\Backup\Providers;

use HuberwayCMS\Backup\Commands\BackupCleanCommand;
use HuberwayCMS\Backup\Commands\BackupCreateCommand;
use HuberwayCMS\Backup\Commands\BackupListCommand;
use HuberwayCMS\Backup\Commands\BackupRemoveCommand;
use HuberwayCMS\Backup\Commands\BackupRestoreCommand;
use HuberwayCMS\Base\Supports\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            BackupCreateCommand::class,
            BackupRestoreCommand::class,
            BackupRemoveCommand::class,
            BackupListCommand::class,
            BackupCleanCommand::class,
        ]);
    }
}
