<?php

namespace HuberwayCMS\Base\Providers;

use HuberwayCMS\Base\Commands\ActivateLicenseCommand;
use HuberwayCMS\Base\Commands\CleanupSystemCommand;
use HuberwayCMS\Base\Commands\ClearExpiredCacheCommand;
use HuberwayCMS\Base\Commands\ClearLogCommand;
use HuberwayCMS\Base\Commands\ExportDatabaseCommand;
use HuberwayCMS\Base\Commands\FetchGoogleFontsCommand;
use HuberwayCMS\Base\Commands\ImportDatabaseCommand;
use HuberwayCMS\Base\Commands\InstallCommand;
use HuberwayCMS\Base\Commands\PublishAssetsCommand;
use HuberwayCMS\Base\Commands\UpdateCommand;
use HuberwayCMS\Base\Supports\ServiceProvider;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\AboutCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ActivateLicenseCommand::class,
            CleanupSystemCommand::class,
            ClearExpiredCacheCommand::class,
            ClearLogCommand::class,
            ExportDatabaseCommand::class,
            FetchGoogleFontsCommand::class,
            ImportDatabaseCommand::class,
            InstallCommand::class,
            PublishAssetsCommand::class,
            UpdateCommand::class,
        ]);

        AboutCommand::add('Core Information', fn () => [
            'CMS Version' => get_cms_version(),
            'Core Version' => get_core_version(),
        ]);

        $this->app->afterResolving(Schedule::class, function (Schedule $schedule) {
            $schedule->command(ClearExpiredCacheCommand::class)->everyFiveMinutes();
        });
    }
}
