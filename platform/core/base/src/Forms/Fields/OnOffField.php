<?php

namespace HuberwayCMS\Base\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class OnOffField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.on-off';
    }
}
