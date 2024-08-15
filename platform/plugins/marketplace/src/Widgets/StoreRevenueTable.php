<?php

namespace HuberwayCMS\Marketplace\Widgets;

use HuberwayCMS\Base\Widgets\Table;
use HuberwayCMS\Marketplace\Tables\StoreRevenueTable as BaseStoreRevenueTable;

class StoreRevenueTable extends Table
{
    protected string $table = BaseStoreRevenueTable::class;

    protected string $route = 'marketplace.reports.store-revenues';

    public function getLabel(): string
    {
        return trans('plugins/marketplace::marketplace.reports.store_revenues');
    }
}
