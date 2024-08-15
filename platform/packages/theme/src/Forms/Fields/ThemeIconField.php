<?php

namespace HuberwayCMS\Theme\Forms\Fields;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FormField;

class ThemeIconField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addScriptsDirectly('vendor/core/packages/theme/js/icons-field.js');

        return 'packages/theme::fields.icons-field';
    }
}
