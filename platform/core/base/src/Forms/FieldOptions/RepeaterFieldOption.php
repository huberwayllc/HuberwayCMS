<?php

namespace HuberwayCMS\Base\Forms\FieldOptions;

use HuberwayCMS\Base\Forms\FormFieldOptions;

class RepeaterFieldOption extends FormFieldOptions
{
    protected array $fields = [];

    public function fields(array $fields): static
    {
        $this->fields = $fields;

        return $this;
    }

    public function toArray(): array
    {
        $data = parent::toArray();

        if ($fields = $this->fields) {
            $data['fields'] = $fields;
        }

        return $data;
    }
}
