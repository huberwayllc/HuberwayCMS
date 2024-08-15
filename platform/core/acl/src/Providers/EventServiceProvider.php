<?php

namespace HuberwayCMS\ACL\Providers;

use HuberwayCMS\ACL\Events\RoleAssignmentEvent;
use HuberwayCMS\ACL\Events\RoleUpdateEvent;
use HuberwayCMS\ACL\Listeners\LoginListener;
use HuberwayCMS\ACL\Listeners\RoleAssignmentListener;
use HuberwayCMS\ACL\Listeners\RoleUpdateListener;
use Illuminate\Auth\Events\Login;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RoleUpdateEvent::class => [
            RoleUpdateListener::class,
        ],
        RoleAssignmentEvent::class => [
            RoleAssignmentListener::class,
        ],
        Login::class => [
            LoginListener::class,
        ],
    ];
}
