<?php

namespace HuberwayCMS\Menu\Providers;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Menu\Listeners\DeleteMenuNodeListener;
use HuberwayCMS\Menu\Listeners\UpdateMenuNodeUrlListener;
use HuberwayCMS\Slug\Events\UpdatedSlugEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedSlugEvent::class => [
            UpdateMenuNodeUrlListener::class,
        ],
        DeletedContentEvent::class => [
            DeleteMenuNodeListener::class,
        ],
    ];
}
