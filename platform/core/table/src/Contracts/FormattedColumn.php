<?php

namespace HuberwayCMS\Table\Contracts;

use HuberwayCMS\Base\Contracts\BaseModel;
use HuberwayCMS\Table\Abstracts\TableAbstract;

interface FormattedColumn
{
    public function formattedValue($value): string|null;

    public function renderCell(BaseModel|array $item, TableAbstract $table): string;
}
