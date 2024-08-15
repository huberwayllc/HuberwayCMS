<?php

namespace HuberwayCMS\PluginManagement\Providers;

use HuberwayCMS\Base\Events\SeederPrepared;
use HuberwayCMS\Base\Events\SystemUpdateDBMigrated;
use HuberwayCMS\Base\Events\SystemUpdatePublished;
use HuberwayCMS\Base\Listeners\ClearDashboardMenuCaches;
use HuberwayCMS\PluginManagement\Events\ActivatedPluginEvent;
use HuberwayCMS\PluginManagement\Listeners\ActivateAllPlugins;
use HuberwayCMS\PluginManagement\Listeners\ClearPluginCaches;
use HuberwayCMS\PluginManagement\Listeners\CoreUpdatePluginsDB;
use HuberwayCMS\PluginManagement\Listeners\PublishPluginAssets;
use Illuminate\Contracts\Database\Events\MigrationEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        MigrationEvent::class => [
            ClearPluginCaches::class,
        ],
        SystemUpdateDBMigrated::class => [
            CoreUpdatePluginsDB::class,
        ],
        SystemUpdatePublished::class => [
            PublishPluginAssets::class,
        ],
        SeederPrepared::class => [
            ActivateAllPlugins::class,
        ],
        ActivatedPluginEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
    ];
}
