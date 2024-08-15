<?php

namespace HuberwayCMS\Language\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class LanguageSwitcherField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/language::forms.fields.language-switcher';
    }
}
