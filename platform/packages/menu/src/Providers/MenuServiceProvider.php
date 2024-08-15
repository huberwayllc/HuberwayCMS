<?php

namespace HuberwayCMS\Menu\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Menu\Models\Menu as MenuModel;
use HuberwayCMS\Menu\Models\MenuLocation;
use HuberwayCMS\Menu\Models\MenuNode;
use HuberwayCMS\Menu\Repositories\Eloquent\MenuLocationRepository;
use HuberwayCMS\Menu\Repositories\Eloquent\MenuNodeRepository;
use HuberwayCMS\Menu\Repositories\Eloquent\MenuRepository;
use HuberwayCMS\Menu\Repositories\Interfaces\MenuInterface;
use HuberwayCMS\Menu\Repositories\Interfaces\MenuLocationInterface;
use HuberwayCMS\Menu\Repositories\Interfaces\MenuNodeInterface;
use HuberwayCMS\Theme\Events\RenderingAdminBar;
use HuberwayCMS\Theme\Facades\AdminBar;

class MenuServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this
            ->setNamespace('packages/menu')
            ->loadHelpers();

        $this->app->bind(MenuInterface::class, function () {
            return new MenuRepository(new MenuModel());
        });

        $this->app->bind(MenuNodeInterface::class, function () {
            return new MenuNodeRepository(new MenuNode());
        });

        $this->app->bind(MenuLocationInterface::class, function () {
            return new MenuLocationRepository(new MenuLocation());
        });
    }

    public function boot(): void
    {
        $this
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-core-menu',
                    'priority' => 2,
                    'parent_id' => 'cms-core-appearance',
                    'name' => 'packages/menu::menu.name',
                    'route' => 'menus.index',
                ]);
        });

        $this->app['events']->listen(RenderingAdminBar::class, function () {
            AdminBar::registerLink(
                trans('packages/menu::menu.name'),
                route('menus.index'),
                'appearance',
                'menus.index'
            );
        });

        $this->app->register(EventServiceProvider::class);
        $this->app->register(CommandServiceProvider::class);
    }
}
