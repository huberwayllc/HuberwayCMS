<?php

namespace HuberwayCMS\AuditLog\Providers;

use HuberwayCMS\AuditLog\Events\AuditHandlerEvent;
use HuberwayCMS\AuditLog\Listeners\AuditHandlerListener;
use HuberwayCMS\AuditLog\Listeners\CreatedContentListener;
use HuberwayCMS\AuditLog\Listeners\DeletedContentListener;
use HuberwayCMS\AuditLog\Listeners\LoginListener;
use HuberwayCMS\AuditLog\Listeners\UpdatedContentListener;
use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use Illuminate\Auth\Events\Login;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        AuditHandlerEvent::class => [
            AuditHandlerListener::class,
        ],
        Login::class => [
            LoginListener::class,
        ],
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        CreatedContentEvent::class => [
            CreatedContentListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
    ];
}
