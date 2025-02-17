<?php

namespace HuberwayCMS\Translation\Http\Controllers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Supports\Language;
use HuberwayCMS\Setting\Http\Controllers\SettingController;
use HuberwayCMS\Translation\Manager;
use HuberwayCMS\Translation\Tables\ThemeTranslationTable;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;

class ThemeTranslationController extends SettingController
{
    public function index(Request $request, ThemeTranslationTable $translationTable)
    {
        $this->pageTitle(trans('plugins/translation::translation.theme-translations'));

        Assets::addStylesDirectly('vendor/core/plugins/translation/css/translation.css');

        $groups = Language::getAvailableLocales();

        $defaultLanguage = Language::getDefaultLanguage();

        if (! count($groups)) {
            $groups = [
                'en' => $defaultLanguage,
            ];
        }

        $currentLocale = $request->has('ref_lang') ? $request->input('ref_lang') : app()->getLocale();

        $group = Arr::first($groups, fn ($item) => $item['locale'] == $currentLocale);

        if (! $group) {
            $group = $defaultLanguage;
        }

        $translationTable->setLocale($group['locale']);

        if ($request->expectsJson()) {
            return $translationTable->renderTable();
        }

        return view(
            'plugins/translation::theme-translations',
            compact('groups', 'group', 'defaultLanguage', 'translationTable')
        );
    }

    public function update(Request $request, Manager $manager)
    {
        if (! File::isDirectory(lang_path())) {
            File::makeDirectory(lang_path());
        }

        if (! File::isWritable(lang_path())) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(trans('plugins/translation::translation.folder_is_not_writeable', ['lang_path' => lang_path()]));
        }

        $locale = $request->input('pk');

        if ($locale) {
            $translations = $manager->getThemeTranslations($locale);

            if ($request->has('name') && $request->has('value') && Arr::has($translations, $request->input('name'))) {
                $translations[$request->input('name')] = $request->input('value');
            }

            $manager->saveThemeTranslations($locale, $translations);
        }

        return $this
            ->httpResponse()
            ->setPreviousRoute('translations.theme-translations')
            ->withUpdatedSuccessMessage();
    }
}
