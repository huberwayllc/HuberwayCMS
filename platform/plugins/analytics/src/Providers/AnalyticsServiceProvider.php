<?php

namespace HuberwayCMS\Analytics\Providers;

use HuberwayCMS\Analytics\Abstracts\AnalyticsAbstract;
use HuberwayCMS\Analytics\Analytics;
use HuberwayCMS\Analytics\Exceptions\InvalidConfiguration;
use HuberwayCMS\Analytics\Facades\Analytics as AnalyticsFacade;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Setting\PanelSections\SettingOthersPanelSection;
use Illuminate\Foundation\AliasLoader;

class AnalyticsServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(AnalyticsAbstract::class, function () {
            if (! ($credentials = setting('analytics_service_account_credentials'))) {
                throw InvalidConfiguration::credentialsIsNotValid();
            }

            if (! ($propertyId = setting('analytics_property_id')) || ! is_numeric($propertyId)) {
                throw InvalidConfiguration::invalidPropertyId();
            }

            return new Analytics($propertyId, $credentials);
        });

        AliasLoader::getInstance()->alias('Analytics', AnalyticsFacade::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/analytics')
            ->loadAndPublishConfigurations(['general', 'permissions'])
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('analytics')
                    ->setTitle(trans('plugins/analytics::analytics.settings.title'))
                    ->withIcon('ti ti-brand-google-analytics')
                    ->withDescription(trans('plugins/analytics::analytics.settings.description'))
                    ->withPriority(160)
                    ->withRoute('analytics.settings')
            );
        });

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });
    }
}
