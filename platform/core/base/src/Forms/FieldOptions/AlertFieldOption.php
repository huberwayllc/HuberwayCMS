<?php

namespace HuberwayCMS\Base\Forms\FieldOptions;

use HuberwayCMS\Base\Supports\Builders\HasAttributes;
use HuberwayCMS\Base\Traits\Forms\CanSpanColumns;

class AlertFieldOption extends HtmlFieldOption
{
    use CanSpanColumns;
    use HasAttributes;

    protected string $type = 'info';

    public function type(string $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function toArray(): array
    {
        $data = parent::toArray();

        $data['attr'] = $this->getAttributes();

        $data['type'] = $this->type;

        if ($this->colspan) {
            $data['colspan'] = $this->getColspan();
        }

        return $data;
    }
}
