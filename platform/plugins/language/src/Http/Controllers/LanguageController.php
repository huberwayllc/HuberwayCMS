<?php

namespace HuberwayCMS\Language\Http\Controllers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Supports\Language;
use HuberwayCMS\Language\Facades\Language as LanguageFacade;
use HuberwayCMS\Language\Forms\Settings\LanguageSettingForm;
use HuberwayCMS\Language\Http\Requests\LanguageRequest;
use HuberwayCMS\Language\LanguageManager;
use HuberwayCMS\Language\Models\Language as LanguageModel;
use HuberwayCMS\Language\Models\LanguageMeta;
use HuberwayCMS\Setting\Facades\Setting;
use HuberwayCMS\Setting\Http\Controllers\SettingController;
use HuberwayCMS\Theme\Facades\Theme;
use HuberwayCMS\Theme\Facades\ThemeOption;
use HuberwayCMS\Translation\Manager;
use HuberwayCMS\Widget\Models\Widget;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\URL;
use Throwable;

class LanguageController extends SettingController
{
    public function index()
    {
        $this->pageTitle(trans('plugins/language::language.name'));

        Assets::addScriptsDirectly(['vendor/core/plugins/language/js/language.js']);

        $languages = Language::getListLanguages();
        $flags = Language::getListLanguageFlags();
        $activeLanguages = LanguageModel::query()->get();

        $languageSettingForm = LanguageSettingForm::create();

        return view('plugins/language::index', compact('languages', 'flags', 'activeLanguages', 'languageSettingForm'));
    }

    public function store(LanguageRequest $request, LanguageManager $languageManager)
    {
        try {
            $language = LanguageModel::query()
                ->where('lang_code', $request->input('lang_code'))
                ->first();

            if ($language) {
                return $this
                    ->httpResponse()
                    ->setError()
                    ->setMessage(trans('plugins/language::language.added_already'));
            }

            if (! LanguageModel::query()->exists()) {
                $request->merge(['lang_is_default' => 1]);
            }

            File::ensureDirectoryExists(lang_path('vendor'));

            if (! File::isWritable(lang_path()) || ! File::isWritable(lang_path('vendor'))) {
                return $this
                    ->httpResponse()
                    ->setError()
                    ->setMessage(
                        trans('plugins/translation::translation.folder_is_not_writeable', ['lang_path' => lang_path()])
                    );
            }

            $locale = $request->input('lang_locale');

            if (! File::isDirectory(lang_path($locale))) {
                $importedLocale = false;

                if (is_plugin_active('translation')) {
                    $result = app(Manager::class)->downloadRemoteLocale($locale);

                    $importedLocale = ! $result['error'];
                }

                if (! $importedLocale) {
                    $defaultLocale = lang_path('en');
                    if (File::exists($defaultLocale)) {
                        File::copyDirectory($defaultLocale, lang_path($locale));
                    }

                    $this->createLocaleInPath(lang_path('vendor/core'), $locale);
                    $this->createLocaleInPath(lang_path('vendor/packages'), $locale);
                    $this->createLocaleInPath(lang_path('vendor/plugins'), $locale);

                    $themeLocale = Arr::first(BaseHelper::scanFolder(theme_path(Theme::getThemeName() . '/lang')));

                    if ($themeLocale) {
                        File::copy(
                            theme_path(Theme::getThemeName() . '/lang/' . $themeLocale),
                            lang_path($locale . '.json')
                        );
                    }
                }
            }

            $language = LanguageModel::query()->create($request->except('lang_id'));

            $this->clearRoutesCache();

            event(new CreatedContentEvent(LANGUAGE_MODULE_SCREEN_NAME, $request, $language));

            try {
                $models = $languageManager->supportedModels();

                if (LanguageModel::query()->count() == 1) {
                    foreach ($models as $model) {
                        if (! class_exists($model)) {
                            continue;
                        }

                        $ids = LanguageMeta::query()->where('reference_type', $model)
                            ->pluck('reference_id')
                            ->all();

                        $table = (new $model())->getTable();

                        $referenceIds = DB::table($table)
                            ->whereNotIn('id', $ids)
                            ->pluck('id')
                            ->all();

                        $data = [];
                        foreach ($referenceIds as $referenceId) {
                            $data[] = [
                                'reference_id' => $referenceId,
                                'reference_type' => $model,
                                'lang_meta_code' => $language->lang_code,
                                'lang_meta_origin' => md5($referenceId . $model . time()),
                            ];
                        }

                        LanguageMeta::query()->insert($data);
                    }
                }
            } catch (Throwable $exception) {
                return $this
                    ->httpResponse()
                    ->setData(view('plugins/language::partials.language-item', ['item' => $language])->render())
                    ->setMessage($exception->getMessage());
            }

            return $this
                ->httpResponse()
                ->setData(view('plugins/language::partials.language-item', ['item' => $language])->render())
                ->withCreatedSuccessMessage();
        } catch (Throwable $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function update(Request $request)
    {
        try {
            $language = LanguageModel::query()->where('lang_id', $request->input('lang_id'))->first();
            if (empty($language)) {
                abort(404);
            }

            $language->fill($request->input());
            $language->save();

            $this->clearRoutesCache();

            event(new UpdatedContentEvent(LANGUAGE_MODULE_SCREEN_NAME, $request, $language));

            return $this
                ->httpResponse()
                ->setData(view('plugins/language::partials.language-item', ['item' => $language])->render())
                ->withUpdatedSuccessMessage();
        } catch (Throwable $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function postChangeItemLanguage(Request $request)
    {
        $referenceId = $request->input('reference_id') ?: $request->input('lang_meta_created_from');
        $currentLanguage = LanguageMeta::query()
            ->where([
                'reference_id' => $referenceId,
                'reference_type' => $request->input('reference_type'),
            ])
            ->first();

        $others = LanguageMeta::query();

        if ($currentLanguage) {
            $others = $others
                ->where('lang_meta_code', '!=', $request->input('lang_meta_current_language'))
                ->where('lang_meta_origin', $currentLanguage->origin);
        }

        $others = $others->select(['reference_id', 'lang_meta_code'])->get();

        $data = [];
        foreach ($others as $other) {
            $language = LanguageModel::query()
                ->where('lang_code', $other->lang_code)
                ->select([
                    'lang_flag',
                    'lang_name',
                    'lang_code',
                ])
                ->first();

            if (! empty($language) && ! empty($currentLanguage) && $language->lang_code != $currentLanguage->lang_meta_code) {
                $data[$language->lang_code]['lang_flag'] = $language->lang_flag;
                $data[$language->lang_code]['lang_name'] = $language->lang_name;
                $data[$language->lang_code]['reference_id'] = $other->reference_id;
            }
        }

        $languages = LanguageModel::query()->get();
        foreach ($languages as $language) {
            if (! array_key_exists(
                $language->lang_code,
                $data
            ) && $language->lang_code != $request->input('lang_meta_current_language')) {
                $data[$language->lang_code]['lang_flag'] = $language->lang_flag;
                $data[$language->lang_code]['lang_name'] = $language->lang_name;
                $data[$language->lang_code]['reference_id'] = null;
            }
        }

        return $this
            ->httpResponse()
            ->setData($data);
    }

    public function destroy(int|string $id)
    {
        $language = LanguageModel::query()->where('lang_id', $id)->first();

        return DeleteResourceAction::make($language)
            ->afterDeleting(function (DeleteResourceAction $action) {
                $defaultLanguageId = false;

                if ($action->getModel()->lang_is_default) {
                    $defaultLanguage = LanguageModel::query()->where('lang_is_default', 1)->first();

                    if ($defaultLanguage) {
                        $defaultLanguageId = $defaultLanguage->lang_id;
                    }
                }

                $this->clearRoutesCache();

                $this->httpResponse()->setData($defaultLanguageId);
            });
    }

    public function getSetDefault(Request $request)
    {
        $newLanguageId = $request->input('lang_id');

        $newLanguage = LanguageModel::query()->where('lang_id', $newLanguageId)->first();

        if (! $newLanguage) {
            abort(404);
        }

        $newLanguageCode = $newLanguage->lang_code;

        $themeName = Theme::getThemeName();

        $defaultLanguage = LanguageFacade::getDefaultLanguage(['lang_id', 'lang_code']);

        if ($defaultLanguage) {
            $currentLanguageId = $defaultLanguage->lang_id;
            $currentLanguageCode = $defaultLanguage->lang_code;

            try {
                if ($currentLanguageId != $newLanguageId) {
                    if (! Widget::query()->where('theme', Widget::getThemeName($newLanguageCode))->exists()) {
                        $widgets = Widget::query()->where('theme', $themeName)->get();

                        foreach ($widgets as $widget) {
                            $replicated = $widget->replicate();

                            $widget->theme = Widget::getThemeName($currentLanguageCode);
                            $widget->save();

                            $replicated->save();
                        }
                    } else {
                        $currentWidgets = Widget::query()->where('theme', Widget::getThemeName($newLanguageCode))->get();

                        Widget::query()->where('theme', Widget::getThemeName($newLanguageCode))->delete();

                        $widgets = Widget::query()->where('theme', $themeName)->get();

                        foreach ($widgets as $widget) {
                            $widget->theme = Widget::getThemeName($currentLanguageCode);
                            $widget->save();
                        }

                        foreach ($currentWidgets as $widget) {
                            $widget = $widget->replicate();
                            $widget->theme = $themeName;
                            $widget->save();
                        }
                    }

                    $themeOptionKey = ThemeOption::getOptionKey('', $currentLanguageCode);

                    if (! Setting::newQuery()->where(
                        'key',
                        'LIKE',
                        ThemeOption::getOptionKey('%', $newLanguageCode)
                    )->exists()) {
                        $themeOptions = Setting::newQuery()->where('key', 'LIKE', $themeOptionKey . '%')->get();

                        foreach ($themeOptions as $themeOption) {
                            $replicated = $themeOption->replicate();

                            $themeOption->key = str_replace(
                                ThemeOption::getOption($themeOption->key, $defaultLanguage->lang_code),
                                ThemeOption::getOption($themeOption->key),
                                $themeOption->key
                            );
                            $themeOption->save();

                            $replicated->save();
                        }
                    } else {
                        $currentThemeOptions = Setting::newQuery()->where(
                            'key',
                            'LIKE',
                            ThemeOption::getOptionKey('%', $newLanguageCode)
                        )->get();

                        Setting::newQuery()
                            ->where('key', 'LIKE', ThemeOption::getOptionKey('%', $newLanguageCode))
                            ->delete();

                        $themeOptions = Setting::newQuery()->where('key', 'LIKE', $themeOptionKey . '%')->get();

                        foreach ($themeOptions as $themeOption) {
                            $themeOption->key = str_replace(
                                $themeOptionKey,
                                ThemeOption::getOptionKey('', $currentLanguageCode),
                                $themeOption->key
                            );

                            $themeOption->save();
                        }

                        foreach ($currentThemeOptions as $themeOption) {
                            $themeOption = $themeOption->replicate();

                            $themeOption->key = str_replace(
                                ThemeOption::getOptionKey('', $newLanguageCode),
                                $themeOptionKey,
                                $themeOption->key
                            );

                            $themeOption->save();
                        }
                    }
                }
            } catch (Throwable $exception) {
                BaseHelper::logError($exception);
            }
        }

        LanguageModel::query()->where('lang_is_default', 1)->update(['lang_is_default' => 0]);

        $newLanguage->lang_is_default = 1;
        $newLanguage->save();

        $this->clearRoutesCache();

        event(new UpdatedContentEvent(LANGUAGE_MODULE_SCREEN_NAME, $request, $newLanguage));

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function getLanguage(Request $request)
    {
        $language = LanguageModel::query()->where('lang_id', $request->input('lang_id'))->first();

        return $this
            ->httpResponse()
            ->setData($language);
    }

    public function getChangeDataLanguage($code, LanguageManager $language)
    {
        $previousUrl = strtok(URL::previous(), '?');

        $queryString = null;
        if ($code !== $language->getDefaultLocaleCode()) {
            $queryString = '?' . http_build_query([LanguageFacade::refLangKey() => $code]);
        }

        return redirect()->to($previousUrl . $queryString);
    }

    protected function createLocaleInPath(string $path, string $locale): int
    {
        $folders = File::directories($path);

        foreach ($folders as $module) {
            foreach (File::directories($module) as $item) {
                if (File::name($item) == 'en') {
                    File::copyDirectory($item, $module . '/' . $locale);
                }
            }
        }

        return count($folders);
    }

    public function clearRoutesCache(): bool
    {
        $path = app()->getCachedRoutesPath();

        foreach (LanguageFacade::getSupportedLanguagesKeys() as $locale) {
            if (! $locale) {
                $locale = LanguageFacade::getDefaultLocale();
            }

            $path = substr($path, 0, -4) . '_' . $locale . '.php';

            if (File::exists($path)) {
                File::delete($path);
            }
        }

        return true;
    }
}
