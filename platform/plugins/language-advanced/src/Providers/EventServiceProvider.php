<?php

namespace HuberwayCMS\LanguageAdvanced\Providers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\LanguageAdvanced\Listeners\AddDefaultTranslations;
use HuberwayCMS\LanguageAdvanced\Listeners\AddRefLangToAdminBar;
use HuberwayCMS\LanguageAdvanced\Listeners\ClearCacheAfterUpdateData;
use HuberwayCMS\LanguageAdvanced\Listeners\PriorityLanguageAdvancedPluginListener;
use HuberwayCMS\LanguageAdvanced\Listeners\UpdatePermalinkSettingsForEachLanguage;
use HuberwayCMS\PluginManagement\Events\ActivatedPluginEvent;
use HuberwayCMS\Slug\Events\UpdatedPermalinkSettings;
use HuberwayCMS\Theme\Events\RenderingAdminBar;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        CreatedContentEvent::class => [
            AddDefaultTranslations::class,
        ],
        UpdatedContentEvent::class => [
            ClearCacheAfterUpdateData::class,
        ],
        ActivatedPluginEvent::class => [
            PriorityLanguageAdvancedPluginListener::class,
        ],
        UpdatedPermalinkSettings::class => [
            UpdatePermalinkSettingsForEachLanguage::class,
        ],
        RenderingAdminBar::class => [
            AddRefLangToAdminBar::class,
        ],
    ];
}
