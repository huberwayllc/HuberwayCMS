<?php

namespace HuberwayCMS\Theme\Providers;

use HuberwayCMS\Base\Events\FormRendering;
use HuberwayCMS\Base\Events\SeederPrepared;
use HuberwayCMS\Base\Events\SystemUpdateDBMigrated;
use HuberwayCMS\Base\Events\SystemUpdatePublished;
use HuberwayCMS\Theme\Listeners\AddFormJsValidation;
use HuberwayCMS\Theme\Listeners\CoreUpdateThemeDB;
use HuberwayCMS\Theme\Listeners\PublishThemeAssets;
use HuberwayCMS\Theme\Listeners\SetDefaultTheme;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        SystemUpdateDBMigrated::class => [
            CoreUpdateThemeDB::class,
        ],
        SystemUpdatePublished::class => [
            PublishThemeAssets::class,
        ],
        SeederPrepared::class => [
            SetDefaultTheme::class,
        ],
        FormRendering::class => [
            AddFormJsValidation::class,
        ],
    ];
}
