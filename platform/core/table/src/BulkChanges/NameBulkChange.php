<?php

namespace HuberwayCMS\Table\BulkChanges;

class NameBulkChange extends TextBulkChange
{
    public static function make(array $data = []): static
    {
        return parent::make()
            ->name('name')
            ->title(trans('core/base::tables.name'));
    }
}
