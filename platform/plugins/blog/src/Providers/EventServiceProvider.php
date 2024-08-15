<?php

namespace HuberwayCMS\Blog\Providers;

use HuberwayCMS\Blog\Listeners\RenderingSiteMapListener;
use HuberwayCMS\Theme\Events\RenderingSiteMapEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
    ];
}
