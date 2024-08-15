<?php

namespace HuberwayCMS\Base\Listeners;

use HuberwayCMS\Base\Facades\DashboardMenu;

class ClearDashboardMenuCaches
{
    public function handle(): void
    {
        DashboardMenu::clearCaches();
    }
}
