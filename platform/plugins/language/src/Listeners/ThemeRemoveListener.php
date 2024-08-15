<?php

namespace HuberwayCMS\Language\Listeners;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\Setting\Models\Setting;
use HuberwayCMS\Theme\Events\ThemeRemoveEvent;
use HuberwayCMS\Theme\Facades\ThemeOption;
use HuberwayCMS\Widget\Models\Widget;
use Exception;

class ThemeRemoveListener
{
    public function handle(ThemeRemoveEvent $event): void
    {
        try {
            $languages = Language::getActiveLanguage(['lang_code']);

            foreach ($languages as $language) {
                Widget::query()
                    ->where(['theme' => Widget::getThemeName($language->lang_code, theme: $event->theme)])
                    ->delete();

                Setting::query()
                    ->where(['key', 'LIKE', ThemeOption::getOptionKey('%', $language->lang_code)])
                    ->delete();
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
