<?php

namespace HuberwayCMS\Slug\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class PermalinkField extends FormField
{
    protected function getTemplate(): string
    {
        return 'packages/slug::forms.fields.permalink';
    }
}
