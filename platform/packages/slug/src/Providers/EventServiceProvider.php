<?php

namespace HuberwayCMS\Slug\Providers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\FinishedSeederEvent;
use HuberwayCMS\Base\Events\SeederPrepared;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Slug\Listeners\CreatedContentListener;
use HuberwayCMS\Slug\Listeners\CreateMissingSlug;
use HuberwayCMS\Slug\Listeners\DeletedContentListener;
use HuberwayCMS\Slug\Listeners\TruncateSlug;
use HuberwayCMS\Slug\Listeners\UpdatedContentListener;
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
        SeederPrepared::class => [
            TruncateSlug::class,
        ],
        FinishedSeederEvent::class => [
            CreateMissingSlug::class,
        ],
    ];
}
