<?php

namespace HuberwayCMS\Faq\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Faq\Contracts\Faq as FaqContract;
use HuberwayCMS\Faq\FaqSupport;
use HuberwayCMS\Faq\Models\Faq;
use HuberwayCMS\Faq\Models\FaqCategory;
use HuberwayCMS\Faq\Repositories\Eloquent\FaqCategoryRepository;
use HuberwayCMS\Faq\Repositories\Eloquent\FaqRepository;
use HuberwayCMS\Faq\Repositories\Interfaces\FaqCategoryInterface;
use HuberwayCMS\Faq\Repositories\Interfaces\FaqInterface;
use HuberwayCMS\LanguageAdvanced\Supports\LanguageAdvancedManager;
use HuberwayCMS\Setting\PanelSections\SettingOthersPanelSection;

class FaqServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(FaqCategoryInterface::class, function () {
            return new FaqCategoryRepository(new FaqCategory());
        });

        $this->app->bind(FaqInterface::class, function () {
            return new FaqRepository(new Faq());
        });

        $this->app->singleton(FaqContract::class, FaqSupport::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/faq')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->publishAssets();

        if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Faq::class, [
                'question',
                'answer',
            ]);

            LanguageAdvancedManager::registerModule(FaqCategory::class, [
                'name',
            ]);

            LanguageAdvancedManager::addTranslatableMetaBox('faq_schema_config_wrapper');

            foreach (config('plugins.faq.general.schema_supported', []) as $item) {
                $translatableColumns = array_merge(LanguageAdvancedManager::getTranslatableColumns($item), ['faq_schema_config', 'faq_ids']);

                LanguageAdvancedManager::registerModule($item, $translatableColumns);
            }
        }

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-faq',
                    'priority' => 420,
                    'name' => 'plugins/faq::faq.name',
                    'icon' => 'ti ti-help-octagon',
                ])
                ->registerItem([
                    'id' => 'cms-plugins-faq-list',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-faq',
                    'name' => 'plugins/faq::faq.name',
                    'route' => 'faq.index',
                ])
                ->registerItem([
                    'id' => 'cms-packages-faq-category',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-faq',
                    'name' => 'plugins/faq::faq-category.name',
                    'icon' => null,
                    'route' => 'faq_category.index',
                ]);
        });

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('faqs')
                    ->setTitle(trans('plugins/faq::faq.settings.title'))
                    ->withIcon('ti ti-settings-question')
                    ->withPriority(420)
                    ->withDescription(trans('plugins/faq::faq.settings.description'))
                    ->withRoute('faqs.settings')
            );
        });

        $this->app->register(HookServiceProvider::class);
        $this->app->register(EventServiceProvider::class);
    }
}
