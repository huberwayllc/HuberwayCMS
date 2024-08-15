<?php

namespace HuberwayCMS\Language\Providers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Installer\Events\InstallerFinished;
use HuberwayCMS\Language\Listeners\ActivatedPluginListener;
use HuberwayCMS\Language\Listeners\AddHrefLangListener;
use HuberwayCMS\Language\Listeners\CreatedContentListener;
use HuberwayCMS\Language\Listeners\CreateSelectedLanguageWhenInstallationFinished;
use HuberwayCMS\Language\Listeners\DeletedContentListener;
use HuberwayCMS\Language\Listeners\ThemeRemoveListener;
use HuberwayCMS\Language\Listeners\UpdatedContentListener;
use HuberwayCMS\PluginManagement\Events\ActivatedPluginEvent;
use HuberwayCMS\Theme\Events\RenderingSingleEvent;
use HuberwayCMS\Theme\Events\ThemeRemoveEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        CreatedContentEvent::class => [
            CreatedContentListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
        ThemeRemoveEvent::class => [
            ThemeRemoveListener::class,
        ],
        ActivatedPluginEvent::class => [
            ActivatedPluginListener::class,
        ],
        RenderingSingleEvent::class => [
            AddHrefLangListener::class,
        ],
        InstallerFinished::class => [
            CreateSelectedLanguageWhenInstallationFinished::class,
        ],
    ];
}
