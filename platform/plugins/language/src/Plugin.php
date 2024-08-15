<?php

namespace HuberwayCMS\Language;

use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use HuberwayCMS\Setting\Facades\Setting;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function activated(): void
    {
        $plugins = get_active_plugins();

        if (($key = array_search('language', $plugins)) !== false) {
            unset($plugins[$key]);
        }

        array_unshift($plugins, 'language');

        Setting::forceSet('activated_plugins', json_encode($plugins))->save();
    }

    public static function remove(): void
    {
        Schema::dropIfExists('languages');
        Schema::dropIfExists('language_meta');

        Setting::delete([
            'language_hide_default',
            'language_switcher_display',
            'language_display',
            'language_hide_languages',
        ]);
    }
}
