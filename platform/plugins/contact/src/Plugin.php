<?php

namespace HuberwayCMS\Contact;

use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use HuberwayCMS\Setting\Facades\Setting;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('contact_replies');
        Schema::dropIfExists('contacts');

        Setting::delete([
            'blacklist_keywords',
            'blacklist_email_domains',
            'enable_math_captcha_for_contact_form',
        ]);
    }
}
