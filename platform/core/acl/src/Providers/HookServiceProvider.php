<?php

namespace HuberwayCMS\ACL\Providers;

use HuberwayCMS\ACL\Hooks\UserWidgetHook;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Dashboard\Events\RenderingDashboardWidgets;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app['events']->listen(RenderingDashboardWidgets::class, function () {
            add_filter(DASHBOARD_FILTER_ADMIN_LIST, [UserWidgetHook::class, 'addUserStatsWidget'], 12, 2);
        });
    }
}
