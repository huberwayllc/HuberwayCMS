<?php

namespace HuberwayCMS\LanguageAdvanced\Listeners;

use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\Theme\Facades\AdminBar;

class AddRefLangToAdminBar
{
    public function handle(): void
    {
        if (Language::getDefaultLocaleCode() === Language::getCurrentLocaleCode()) {
            return;
        }

        $groups = AdminBar::getLinksNoGroup();

        foreach ($groups as &$group) {
            $group['link'] .= sprintf('?%s=%s', Language::refLangKey(), Language::getCurrentLocaleCode());
        }

        AdminBar::setLinksNoGroup($groups);
    }
}
