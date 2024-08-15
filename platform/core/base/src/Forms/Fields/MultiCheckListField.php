<?php

namespace HuberwayCMS\Base\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class MultiCheckListField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.multi-check-list';
    }
}
