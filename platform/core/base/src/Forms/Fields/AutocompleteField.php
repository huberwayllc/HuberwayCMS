<?php

namespace HuberwayCMS\Base\Forms\Fields;

class AutocompleteField extends SelectField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.autocomplete';
    }
}
