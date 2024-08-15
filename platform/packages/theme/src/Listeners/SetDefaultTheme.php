<?php

namespace HuberwayCMS\Theme\Listeners;

use HuberwayCMS\Setting\Facades\Setting;
use HuberwayCMS\Theme\Facades\Theme;

class SetDefaultTheme
{
    public function handle(): void
    {
        Setting::forceSet('theme', Theme::getThemeName())->set('show_admin_bar', 1)->save();
    }
}
