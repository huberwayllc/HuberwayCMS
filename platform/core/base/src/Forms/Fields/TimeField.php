<?php

namespace HuberwayCMS\Base\Forms\Fields;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FormField;

class TimeField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addScripts(['timepicker'])
            ->addStyles(['timepicker']);

        return 'core/base::forms.fields.time';
    }
}
