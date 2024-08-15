<?php

namespace HuberwayCMS\Base\Forms\Fields;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FormField;

class TagField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addStyles('tagify')
            ->addScripts('tagify')
            ->addScriptsDirectly('vendor/core/core/base/js/tags.js');

        return 'core/base::forms.fields.tags';
    }
}
