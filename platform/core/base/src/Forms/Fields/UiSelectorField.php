<?php

namespace HuberwayCMS\Base\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class UiSelectorField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.ui-selector';
    }
}
