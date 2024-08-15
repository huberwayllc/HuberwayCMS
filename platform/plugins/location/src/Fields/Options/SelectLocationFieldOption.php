<?php

namespace HuberwayCMS\Location\Fields\Options;

use HuberwayCMS\Base\Forms\FormFieldOptions;

class SelectLocationFieldOption extends FormFieldOptions
{
    public function toArray(): array
    {
        $data = parent::toArray();

        $data['wrapperClassName'] = 'mb-3 row';

        $colspan = $this->getColspan() ?: 3;

        if ($colspan) {
            $data['wrapper']['class'] = 'col-md-' . (12 / $colspan);
        }

        return $data;
    }
}
