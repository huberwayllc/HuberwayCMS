<?php

namespace HuberwayCMS\Dashboard\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Dashboard\Models\DashboardWidget;
use HuberwayCMS\Dashboard\Models\DashboardWidgetSetting;
use HuberwayCMS\Dashboard\Repositories\Eloquent\DashboardWidgetRepository;
use HuberwayCMS\Dashboard\Repositories\Eloquent\DashboardWidgetSettingRepository;
use HuberwayCMS\Dashboard\Repositories\Interfaces\DashboardWidgetInterface;
use HuberwayCMS\Dashboard\Repositories\Interfaces\DashboardWidgetSettingInterface;

/**
 * @since 02/07/2016 09:50 AM
 */
class DashboardServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(DashboardWidgetInterface::class, function () {
            return new DashboardWidgetRepository(new DashboardWidget());
        });

        $this->app->bind(DashboardWidgetSettingInterface::class, function () {
            return new DashboardWidgetSettingRepository(new DashboardWidgetSetting());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('core/dashboard')
            ->loadHelpers()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets()
            ->loadMigrations();

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-core-dashboard',
                    'priority' => -9999,
                    'name' => 'core/base::layouts.dashboard',
                    'icon' => 'ti ti-home',
                    'route' => 'dashboard.index',
                    'permissions' => false,
                ]);
        });
    }
}
