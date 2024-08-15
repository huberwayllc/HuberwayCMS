<?php

namespace HuberwayCMS\Ecommerce\Listeners;

use HuberwayCMS\Base\Events\RenderingAdminWidgetEvent;
use HuberwayCMS\Ecommerce\Widgets\CustomerChart;
use HuberwayCMS\Ecommerce\Widgets\NewCustomerCard;
use HuberwayCMS\Ecommerce\Widgets\NewOrderCard;
use HuberwayCMS\Ecommerce\Widgets\NewProductCard;
use HuberwayCMS\Ecommerce\Widgets\OrderChart;
use HuberwayCMS\Ecommerce\Widgets\RecentOrdersTable;
use HuberwayCMS\Ecommerce\Widgets\ReportGeneralHtml;
use HuberwayCMS\Ecommerce\Widgets\RevenueCard;
use HuberwayCMS\Ecommerce\Widgets\TopSellingProductsTable;
use HuberwayCMS\Ecommerce\Widgets\TrendingProductsTable;

class RegisterEcommerceWidget
{
    public function handle(RenderingAdminWidgetEvent $event): void
    {
        $event->widget
            ->register([
                RevenueCard::class,
                NewProductCard::class,
                NewCustomerCard::class,
                NewOrderCard::class,
                CustomerChart::class,
                OrderChart::class,
                ReportGeneralHtml::class,
                RecentOrdersTable::class,
                TopSellingProductsTable::class,
                TrendingProductsTable::class,
            ], 'ecommerce');
    }
}
