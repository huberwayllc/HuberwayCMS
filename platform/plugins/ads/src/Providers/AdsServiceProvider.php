<?php

namespace HuberwayCMS\Ads\Providers;

use HuberwayCMS\Ads\Facades\AdsManager;
use HuberwayCMS\Ads\Forms\AdsForm;
use HuberwayCMS\Ads\Models\Ads;
use HuberwayCMS\Ads\Repositories\Eloquent\AdsRepository;
use HuberwayCMS\Ads\Repositories\Interfaces\AdsInterface;
use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;

class AdsServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(AdsInterface::class, function () {
            return new AdsRepository(new Ads());
        });

        AliasLoader::getInstance()->alias('AdsManager', AdsManager::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/ads')
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadHelpers()
            ->loadAndPublishViews();

        DashboardMenu::beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-ads',
                    'priority' => 8,
                    'icon' => 'ti ti-ad-circle',
                    'name' => 'plugins/ads::ads.name',
                    'url' => fn () => route('ads.index'),
                    'permissions' => ['ads.index'],
                ]);
        });

        $this->app['events']->listen(RouteMatched::class, function () {
            if (function_exists('shortcode')) {
                add_shortcode('ads', __('Ads'), __('Ads'), function ($shortcode) {
                    if (! $shortcode->key) {
                        return null;
                    }

                    return AdsManager::displayAds((string)$shortcode->key);
                });

                shortcode()->setAdminConfig('ads', function ($attributes) {
                    $ads = Ads::query()
                        ->wherePublished()
                        ->pluck('name', 'key')
                        ->all();

                    return view('plugins/ads::partials.ads-admin-config', compact('ads', 'attributes'))
                        ->render();
                });
            }
        });

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Ads::class, [
                'name',
                'image',
                'url',
            ]);
        }

        AdsForm::beforeRendering(function () {
            add_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, function ($request, $data = null) {
                if (! $data instanceof Ads || ! in_array(Route::currentRouteName(), ['ads.create', 'ads.edit'])) {
                    return false;
                }

                echo view('plugins/ads::partials.notification')
                    ->render();

                return true;
            }, 45, 2);
        });
    }
}
