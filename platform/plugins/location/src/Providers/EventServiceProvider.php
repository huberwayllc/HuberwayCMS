<?php

namespace HuberwayCMS\Location\Providers;

use HuberwayCMS\Location\Events\ImportedCityEvent;
use HuberwayCMS\Location\Events\ImportedCountryEvent;
use HuberwayCMS\Location\Events\ImportedStateEvent;
use HuberwayCMS\Location\Listeners\CreateCityTranslationListener;
use HuberwayCMS\Location\Listeners\CreateCountryTranslationListener;
use HuberwayCMS\Location\Listeners\CreateStateTranslationListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as BaseServiceProvider;

class EventServiceProvider extends BaseServiceProvider
{
    protected $listen = [
        ImportedCountryEvent::class => [
            CreateCountryTranslationListener::class,
        ],
        ImportedStateEvent::class => [
            CreateStateTranslationListener::class,
        ],
        ImportedCityEvent::class => [
            CreateCityTranslationListener::class,
        ],
    ];
}
