<?php

namespace HuberwayCMS\Widget\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Theme\Events\RenderingAdminBar;
use HuberwayCMS\Theme\Facades\AdminBar;
use HuberwayCMS\Widget\Facades\WidgetGroup;
use HuberwayCMS\Widget\Factories\WidgetFactory;
use HuberwayCMS\Widget\Models\Widget;
use HuberwayCMS\Widget\Repositories\Eloquent\WidgetRepository;
use HuberwayCMS\Widget\Repositories\Interfaces\WidgetInterface;
use HuberwayCMS\Widget\WidgetGroupCollection;
use HuberwayCMS\Widget\Widgets\CoreSimpleMenu;
use HuberwayCMS\Widget\Widgets\Text;
use Illuminate\Contracts\Foundation\Application;

class WidgetServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(WidgetInterface::class, function () {
            return new WidgetRepository(new Widget());
        });

        $this->app->bind('huberwaycms.widget', function (Application $app) {
            return new WidgetFactory($app);
        });

        $this->app->singleton('huberwaycms.widget-group-collection', function (Application $app) {
            return new WidgetGroupCollection($app);
        });

        $this
            ->setNamespace('packages/widget')
            ->loadHelpers();
    }

    public function boot(): void
    {
        $this
            ->loadAndPublishConfigurations(['permissions'])
            ->loadRoutes()
            ->loadMigrations()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        $this->app->booted(function () {
            WidgetGroup::setGroup([
                'id' => 'primary_sidebar',
                'name' => trans('packages/widget::widget.primary_sidebar_name'),
                'description' => trans('packages/widget::widget.primary_sidebar_description'),
            ]);

            register_widget(CoreSimpleMenu::class);
            register_widget(Text::class);
        });

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-core-widget',
                    'priority' => 3,
                    'parent_id' => 'cms-core-appearance',
                    'name' => 'packages/widget::widget.name',
                    'route' => 'widgets.index',
                ]);
        });

        $this->app['events']->listen(RenderingAdminBar::class, function () {
            AdminBar::registerLink(
                trans('packages/widget::widget.name'),
                route('widgets.index'),
                'appearance',
                'widgets.index'
            );
        });
    }
}
