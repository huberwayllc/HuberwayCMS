<?php

namespace HuberwayCMS\Base\Providers;

use HuberwayCMS\ACL\Events\RoleAssignmentEvent;
use HuberwayCMS\ACL\Events\RoleUpdateEvent;
use HuberwayCMS\Base\Events\AdminNotificationEvent;
use HuberwayCMS\Base\Events\BeforeEditContentEvent;
use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\SendMailEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Events\UpdatedEvent;
use HuberwayCMS\Base\Listeners\AdminNotificationListener;
use HuberwayCMS\Base\Listeners\BeforeEditContentListener;
use HuberwayCMS\Base\Listeners\ClearDashboardMenuCaches;
use HuberwayCMS\Base\Listeners\ClearDashboardMenuCachesForLoggedUser;
use HuberwayCMS\Base\Listeners\CreatedContentListener;
use HuberwayCMS\Base\Listeners\DeletedContentListener;
use HuberwayCMS\Base\Listeners\SendMailListener;
use HuberwayCMS\Base\Listeners\UpdatedContentListener;
use Illuminate\Auth\Events\Login;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        SendMailEvent::class => [
            SendMailListener::class,
        ],
        CreatedContentEvent::class => [
            CreatedContentListener::class,
        ],
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
        BeforeEditContentEvent::class => [
            BeforeEditContentListener::class,
        ],
        AdminNotificationEvent::class => [
            AdminNotificationListener::class,
        ],
        UpdatedEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
        Login::class => [
            ClearDashboardMenuCachesForLoggedUser::class,
        ],
        RoleAssignmentEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
        RoleUpdateEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
    ];

    public function boot(): void
    {
        $this->app['events']->listen(['cache:cleared'], function () {
            $this->app['files']->delete(storage_path('cache_keys.json'));
        });
    }
}
