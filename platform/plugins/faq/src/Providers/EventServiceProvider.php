<?php

namespace HuberwayCMS\Faq\Providers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Faq\Listeners\DeletedContentListener;
use HuberwayCMS\Faq\Listeners\SaveFaqListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedContentEvent::class => [
            SaveFaqListener::class,
        ],
        CreatedContentEvent::class => [
            SaveFaqListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
    ];
}
