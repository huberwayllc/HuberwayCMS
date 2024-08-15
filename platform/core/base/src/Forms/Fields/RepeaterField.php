<?php

namespace HuberwayCMS\Base\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class RepeaterField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.repeater';
    }
}
