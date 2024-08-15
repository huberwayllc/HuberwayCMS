<?php

namespace HuberwayCMS\Table\Columns;

use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Table\Columns\Concerns\HasLink;
use HuberwayCMS\Table\Contracts\FormattedColumn as FormattedColumnContract;

class EmailColumn extends FormattedColumn implements FormattedColumnContract
{
    use HasLink;

    public static function make(array|string $data = [], string $name = ''): static
    {
        return parent::make($data ?: 'email', $name)
            ->title(trans('core/base::tables.email'))
            ->alignStart();
    }

    public function formattedValue($value): string|null
    {
        if (! $this->isLinkable() || ! $value) {
            return null;
        }

        return Html::mailto($value, $value);
    }
}
