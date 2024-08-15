<?php

namespace HuberwayCMS\Translation\Providers;

use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Translation\Console\DownloadLocaleCommand;
use HuberwayCMS\Translation\Console\RemoveLocaleCommand;
use HuberwayCMS\Translation\Console\RemoveUnusedTranslationsCommand;
use HuberwayCMS\Translation\Console\UpdateThemeTranslationCommand;
use HuberwayCMS\Translation\PanelSections\LocalizationPanelSection;

class TranslationServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/translation')
            ->loadAndPublishConfigurations(['general', 'permissions'])
            ->loadMigrations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        PanelSectionManager::beforeRendering(function () {
            PanelSectionManager::register(LocalizationPanelSection::class);
        });

        if ($this->app->runningInConsole()) {
            $this->commands([
                UpdateThemeTranslationCommand::class,
                RemoveUnusedTranslationsCommand::class,
                DownloadLocaleCommand::class,
                RemoveLocaleCommand::class,
            ]);
        }
    }
}
