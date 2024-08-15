<?php

namespace HuberwayCMS\Base\Listeners;

use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Base\Facades\DashboardMenu;
use Illuminate\Auth\Events\Login;

class ClearDashboardMenuCachesForLoggedUser
{
    public function handle(Login $event): void
    {
        if (! $event->user instanceof User) {
            return;
        }

        DashboardMenu::default()->clearCachesForCurrentUser();
    }
}
