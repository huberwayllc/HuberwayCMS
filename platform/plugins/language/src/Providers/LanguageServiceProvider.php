<?php

namespace HuberwayCMS\Language\Providers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\Language\Http\Middleware\LocaleSessionRedirect;
use HuberwayCMS\Language\Http\Middleware\LocalizationRedirectFilter;
use HuberwayCMS\Language\Http\Middleware\LocalizationRoutes;
use HuberwayCMS\Language\Models\Language as LanguageModel;
use HuberwayCMS\Language\Models\LanguageMeta;
use HuberwayCMS\Language\Repositories\Eloquent\LanguageMetaRepository;
use HuberwayCMS\Language\Repositories\Eloquent\LanguageRepository;
use HuberwayCMS\Language\Repositories\Interfaces\LanguageInterface;
use HuberwayCMS\Language\Repositories\Interfaces\LanguageMetaInterface;
use HuberwayCMS\Setting\PanelSections\SettingCommonPanelSection;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Arr;

class LanguageServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this
            ->setNamespace('plugins/language')
            ->loadAndPublishConfigurations(['general']);

        $this->app->bind(LanguageInterface::class, function () {
            return new LanguageRepository(new LanguageModel());
        });

        $this->app->bind(LanguageMetaInterface::class, function () {
            return new LanguageMetaRepository(new LanguageMeta());
        });

        AliasLoader::getInstance()->alias('Language', Language::class);

        $router = $this->app['router'];
        $router->aliasMiddleware('localize', LocalizationRoutes::class);
        $router->aliasMiddleware('localizationRedirect', LocalizationRedirectFilter::class);
        $router->aliasMiddleware('localeSessionRedirect', LocaleSessionRedirect::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/language')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->publishAssets();

        $this->app->register(CommandServiceProvider::class);
        $this->app->register(EventServiceProvider::class);

        if (is_plugin_active('language')) {
            add_filter(BASE_FILTER_GROUP_PUBLIC_ROUTE, [$this, 'addLanguageMiddlewareToPublicRoute'], 958);
        }

        if (! $this->app->runningInConsole() && is_plugin_active('language')) {
            PanelSectionManager::default()->beforeRendering(function () {
                PanelSectionManager::registerItem(
                    SettingCommonPanelSection::class,
                    fn () => PanelSectionItem::make('language')
                        ->setTitle(trans('plugins/language::language.name'))
                        ->withIcon('ti ti-language')
                        ->withDescription(trans('plugins/language::language.description'))
                        ->withPriority(100)
                        ->withRoute('languages.index')
                );
            });

            $this->app['events']->listen(RouteMatched::class, function () {
                Assets::addScriptsDirectly('vendor/core/plugins/language/js/language-global.js')
                    ->addStylesDirectly(['vendor/core/plugins/language/css/language.css']);
            });

            $this->app->booted(function () {
                if (defined('THEME_OPTIONS_MODULE_SCREEN_NAME')) {
                    Language::registerModule(THEME_OPTIONS_MODULE_SCREEN_NAME);
                }

                if (defined('WIDGET_MANAGER_MODULE_SCREEN_NAME')) {
                    Language::registerModule(WIDGET_MANAGER_MODULE_SCREEN_NAME);
                }

                if (defined('THEME_OPTIONS_MODULE_SCREEN_NAME') && ! $this->app->isDownForMaintenance()) {
                    Theme::asset()
                        ->usePath(false)
                        ->add(
                            'language-css',
                            asset('vendor/core/plugins/language/css/language-public.css'),
                            [],
                            [],
                            '2.2.0'
                        );

                    Theme::asset()
                        ->container('footer')
                        ->usePath(false)
                        ->add(
                            'language-public-js',
                            asset('vendor/core/plugins/language/js/language-public.js'),
                            ['jquery'],
                            [],
                            '2.2.0'
                        );
                }

                Language::initModelRelations();

                $this->app->register(HookServiceProvider::class);
            });

            Language::setRoutesCachePath();
        }
    }

    public function addLanguageMiddlewareToPublicRoute(array $data): array
    {
        $locale = Language::setLocale();

        if (
            ! isset($data['prefix']) &&
            (! is_in_admin() || ! Language::hideDefaultLocaleInURL() || $locale !== Language::getDefaultLocale())
        ) {
            $data['prefix'] = trim((string)$locale);
        }

        $data['middleware'] = array_merge(Arr::get($data, 'middleware', []), [
            'localeSessionRedirect',
            'localizationRedirect',
        ]);

        $data['middleware'] = array_unique($data['middleware']);

        return $data;
    }
}
