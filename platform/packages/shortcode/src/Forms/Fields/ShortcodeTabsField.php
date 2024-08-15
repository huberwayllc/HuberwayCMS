<?php

namespace HuberwayCMS\Shortcode\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class ShortcodeTabsField extends FormField
{
    protected function getTemplate(): string
    {
        return 'packages/shortcode::forms.fields.tabs';
    }

    public function getDefaults(): array
    {
        return [
            'fields' => [],
            'shortcode_attributes' => [],
            'max' => 20,
        ];
    }
}
