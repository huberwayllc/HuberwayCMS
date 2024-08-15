<?php

namespace HuberwayCMS\Ecommerce\Widgets;

use HuberwayCMS\Base\Widgets\Table;
use HuberwayCMS\Ecommerce\Tables\Reports\TopSellingProductsTable as BaseTopSellingProductsTable;

class TopSellingProductsTable extends Table
{
    protected string $table = BaseTopSellingProductsTable::class;

    protected string $route = 'ecommerce.report.top-selling-products';

    protected int $columns = 6;

    public function getLabel(): string
    {
        return trans('plugins/ecommerce::reports.top_selling_products');
    }
}
