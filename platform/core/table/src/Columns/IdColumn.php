<?php

namespace HuberwayCMS\Table\Columns;

use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Table\Contracts\FormattedColumn as FormattedColumnContract;

class IdColumn extends FormattedColumn implements FormattedColumnContract
{
    public static function make(array|string $data = [], string $name = ''): static
    {
        return parent::make($data ?: 'id', $name)
            ->title(trans('core/base::tables.id'))
            ->alignCenter()
            ->width(20)
            ->columnVisibility();
    }

    public function formattedValue($value): string|null
    {
        return $this
            ->when(BaseModel::getTypeOfId() !== 'BIGINT', function (IdColumn $column) {
                return $column->limit();
            })
            ->applyLimitIfAvailable($value);
    }
}
