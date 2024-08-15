<?php

namespace HuberwayCMS\Base\Forms\Fields;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FormField;

class MediaImagesField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addScripts(['jquery-ui']);

        return 'core/base::forms.fields.media-images';
    }
}
