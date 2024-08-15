<?php

namespace HuberwayCMS\Ecommerce\Widgets;

use HuberwayCMS\Base\Widgets\Table;
use HuberwayCMS\Ecommerce\Tables\Reports\TrendingProductsTable as BaseTrendingProductsTable;

class TrendingProductsTable extends Table
{
    protected string $table = BaseTrendingProductsTable::class;

    protected string $route = 'ecommerce.report.trending-products';

    protected int $columns = 6;

    public function getLabel(): string
    {
        return trans('plugins/ecommerce::reports.trending_products');
    }
}
