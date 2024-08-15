<?php

namespace HuberwayCMS\LanguageAdvanced\Listeners;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Illuminate\Support\Facades\DB;

class AddDefaultTranslations
{
    public function handle(CreatedContentEvent $event): void
    {
        if (! LanguageAdvancedManager::isSupported($event->data)) {
            return;
        }

        $table = $event->data->getTable() . '_translations';

        foreach (Language::getActiveLanguage(['lang_code', 'lang_is_default']) as $language) {
            if ($language->lang_is_default) {
                continue;
            }

            $condition = [
                'lang_code' => $language->lang_code,
                $event->data->getTable() . '_id' => $event->data->getKey(),
            ];

            $existing = DB::table($table)->where($condition)->count();

            if ($existing) {
                continue;
            }

            $dataDefault = apply_filters('filter_before_save_default_translation_advanced', $event->data, $language);

            $data = [];
            foreach (DB::getSchemaBuilder()->getColumnListing($table) as $column) {
                if (! in_array($column, array_keys($condition))) {
                    $data[$column] = $dataDefault->{$column};
                }
            }

            $data = array_merge($data, $condition);

            DB::table($table)->insert($data);
        }
    }
}
