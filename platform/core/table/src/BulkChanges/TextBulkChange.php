<?php

namespace HuberwayCMS\Table\BulkChanges;

use HuberwayCMS\Table\Abstracts\TableBulkChangeAbstract;

class TextBulkChange extends TableBulkChangeAbstract
{
    public static function make(array $data = []): static
    {
        return parent::make()
            ->type('text')
            ->validate(['required', 'string', 'max:255']);
    }
}
