<?php

namespace HuberwayCMS\Table\BulkChanges;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Table\Abstracts\TableBulkChangeAbstract;

class PhoneBulkChange extends TableBulkChangeAbstract
{
    public static function make(array $data = []): static
    {
        return parent::make()
            ->name('phone')
            ->title(trans('core/base::tables.phone'))
            ->type('text')
            ->validate('required|' . BaseHelper::getPhoneValidationRule());
    }
}
