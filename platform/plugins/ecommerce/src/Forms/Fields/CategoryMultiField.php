<?php

namespace HuberwayCMS\Ecommerce\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

/**
 * @deprecated
 */
class CategoryMultiField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.tree-categories';
    }
}
