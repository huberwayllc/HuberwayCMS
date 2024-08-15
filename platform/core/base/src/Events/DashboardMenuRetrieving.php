<?php

namespace HuberwayCMS\Base\Events;

use HuberwayCMS\Base\Supports\DashboardMenu;
use Illuminate\Foundation\Events\Dispatchable;

class DashboardMenuRetrieving
{
    use Dispatchable;

    public function __construct(
        public DashboardMenu $dashboardMenu
    ) {
    }
}
