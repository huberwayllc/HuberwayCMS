<?php

namespace HuberwayCMS\Backup\Providers;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Dashboard\Events\RenderingDashboardWidgets;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app['events']->listen(RenderingDashboardWidgets::class, function () {
            add_filter(DASHBOARD_FILTER_ADMIN_NOTIFICATIONS, [$this, 'registerAdminAlert'], 5);
        });
    }

    public function registerAdminAlert(string|null $alert): string
    {
        if (! BaseHelper::hasDemoModeEnabled()) {
            return $alert;
        }

        return $alert . view('plugins/backup::partials.admin-alert')->render();
    }
}
