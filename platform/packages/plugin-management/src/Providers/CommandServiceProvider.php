<?php

namespace HuberwayCMS\PluginManagement\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\PluginManagement\Commands\ClearCompiledCommand;
use HuberwayCMS\PluginManagement\Commands\IlluminateClearCompiledCommand as OverrideIlluminateClearCompiledCommand;
use HuberwayCMS\PluginManagement\Commands\PackageDiscoverCommand;
use HuberwayCMS\PluginManagement\Commands\PluginActivateAllCommand;
use HuberwayCMS\PluginManagement\Commands\PluginActivateCommand;
use HuberwayCMS\PluginManagement\Commands\PluginAssetsPublishCommand;
use HuberwayCMS\PluginManagement\Commands\PluginDeactivateAllCommand;
use HuberwayCMS\PluginManagement\Commands\PluginDeactivateCommand;
use HuberwayCMS\PluginManagement\Commands\PluginDiscoverCommand;
use HuberwayCMS\PluginManagement\Commands\PluginInstallFromMarketplaceCommand;
use HuberwayCMS\PluginManagement\Commands\PluginListCommand;
use HuberwayCMS\PluginManagement\Commands\PluginRemoveAllCommand;
use HuberwayCMS\PluginManagement\Commands\PluginRemoveCommand;
use Illuminate\Foundation\Console\ClearCompiledCommand as IlluminateClearCompiledCommand;
use Illuminate\Foundation\Console\PackageDiscoverCommand as IlluminatePackageDiscoverCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->extend(IlluminatePackageDiscoverCommand::class, function () {
            return $this->app->make(PackageDiscoverCommand::class);
        });

        $this->app->extend(IlluminateClearCompiledCommand::class, function () {
            return $this->app->make(OverrideIlluminateClearCompiledCommand::class);
        });
    }

    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            $this->commands([
                PluginAssetsPublishCommand::class,
                ClearCompiledCommand::class,
                PluginDiscoverCommand::class,
                PluginInstallFromMarketplaceCommand::class,
                PluginActivateCommand::class,
                PluginActivateAllCommand::class,
                PluginDeactivateCommand::class,
                PluginDeactivateAllCommand::class,
                PluginRemoveCommand::class,
                PluginRemoveAllCommand::class,
                PluginListCommand::class,
            ]);
        }
    }
}
