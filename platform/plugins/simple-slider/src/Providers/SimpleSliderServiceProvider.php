<?php

namespace HuberwayCMS\SimpleSlider\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\Setting\PanelSections\SettingOthersPanelSection;
use HuberwayCMS\SimpleSlider\Models\SimpleSlider;
use HuberwayCMS\SimpleSlider\Models\SimpleSliderItem;
use HuberwayCMS\SimpleSlider\Repositories\Eloquent\SimpleSliderItemRepository;
use HuberwayCMS\SimpleSlider\Repositories\Eloquent\SimpleSliderRepository;
use HuberwayCMS\SimpleSlider\Repositories\Interfaces\SimpleSliderInterface;
use HuberwayCMS\SimpleSlider\Repositories\Interfaces\SimpleSliderItemInterface;

class SimpleSliderServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(SimpleSliderInterface::class, function () {
            return new SimpleSliderRepository(new SimpleSlider());
        });

        $this->app->bind(SimpleSliderItemInterface::class, function () {
            return new SimpleSliderItemRepository(new SimpleSliderItem());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/simple-slider')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-simple-slider',
                    'priority' => 390,
                    'name' => 'plugins/simple-slider::simple-slider.menu',
                    'icon' => 'ti ti-slideshow',
                    'route' => 'simple-slider.index',
                ]);
        });

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('simple_sliders')
                    ->setTitle(trans('plugins/simple-slider::simple-slider.settings.title'))
                    ->withIcon('ti ti-slideshow')
                    ->withPriority(430)
                    ->withDescription(trans('plugins/simple-slider::simple-slider.settings.description'))
                    ->withRoute('simple-slider.settings')
            );
        });

        if (defined('LANGUAGE_MODULE_SCREEN_NAME')) {
            Language::registerModule(SimpleSlider::class);
        }

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });
    }
}
