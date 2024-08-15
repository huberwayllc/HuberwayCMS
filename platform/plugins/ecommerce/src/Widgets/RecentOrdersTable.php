<?php

namespace HuberwayCMS\Ecommerce\Widgets;

use HuberwayCMS\Base\Widgets\Table;
use HuberwayCMS\Ecommerce\Tables\Reports\RecentOrdersTable as BaseRecentOrdersTable;

class RecentOrdersTable extends Table
{
    protected string $table = BaseRecentOrdersTable::class;

    protected string $route = 'ecommerce.report.recent-orders';

    public function getLabel(): string
    {
        return trans('plugins/ecommerce::reports.recent_orders');
    }
}
