<?php

namespace HuberwayCMS\Analytics;

use HuberwayCMS\Dashboard\Models\DashboardWidget;
use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use HuberwayCMS\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        DashboardWidget::query()
            ->whereIn('name', [
                'widget_analytics_general',
                'widget_analytics_page',
                'widget_analytics_browser',
                'widget_analytics_referrer',
            ])
            ->each(fn (DashboardWidget $dashboardWidget) => $dashboardWidget->delete());

        Setting::delete([
            'google_analytics',
            'analytics_property_id',
            'analytics_service_account_credentials',
        ]);
    }
}
