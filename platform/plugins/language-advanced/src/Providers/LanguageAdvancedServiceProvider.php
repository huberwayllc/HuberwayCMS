<?php

namespace HuberwayCMS\LanguageAdvanced\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\Language\Models\Language as LanguageModel;
use HuberwayCMS\LanguageAdvanced\Supports\LanguageAdvancedManager;
use HuberwayCMS\Page\Models\Page;
use HuberwayCMS\Setting\Facades\Setting;
use HuberwayCMS\Slug\Models\Slug;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

class LanguageAdvancedServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        if (! is_plugin_active('language')) {
            return;
        }

        $this->setNamespace('plugins/language-advanced')
            ->loadHelpers()
            ->loadMigrations()
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishViews()
            ->loadRoutes();

        $this->app->register(EventServiceProvider::class);

        add_filter('slug_helper_get_permalink_setting_key', [$this, 'getPermalinkSettingKey'], 1134, 2);

        $this->app->booted(function () {
            LanguageAdvancedManager::initModelRelations();

            $this->app->register(HookServiceProvider::class);
        });

        $config = $this->app['config'];

        if ($config->get('plugins.language-advanced.general.page_use_language_v2')) {
            LanguageAdvancedManager::registerModule(Page::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(Slug::class, [
                'key',
                'prefix',
            ]);

            $supportedModels = Language::supportedModels();

            if (($key = array_search(Page::class, $supportedModels)) !== false) {
                unset($supportedModels[$key]);
            }

            $config->set(['plugins.language.general.supported' => $supportedModels]);
        }

        $this->app['events']->listen('eloquent.deleted: ' . LanguageModel::class, function (LanguageModel $language) {
            foreach (LanguageAdvancedManager::getSupported() as $model => $columns) {
                if (class_exists($model)) {
                    DB::table((new $model())->getTable() . '_translations')
                        ->where('lang_code', $language->lang_code)
                        ->delete();
                }
            }
        });

        foreach (LanguageAdvancedManager::getSupported() as $model => $columns) {
            $this->app['events']->listen('eloquent.deleted: ' . $model, function (Model $model) {
                DB::table($model->getTable() . '_translations')
                    ->where($model->getTable() . '_id', $model->getKey())
                    ->delete();
            });
        }
    }

    public function getPermalinkSettingKey(string $key): string
    {
        $currentLocale = is_in_admin(true) ? Language::getCurrentAdminLocale() : Language::getCurrentLocale();
        $locale = $currentLocale !== Language::getDefaultLocale() ? $currentLocale : null;

        if ($locale && in_array($locale, array_keys(Language::getSupportedLocales()))) {
            $keyLocale = "$key-$locale";

            if (is_in_admin(true) && Route::is('slug.settings')) {
                return $keyLocale;
            }

            return Setting::has($keyLocale) ? $keyLocale : $key;
        }

        return $key;
    }
}
