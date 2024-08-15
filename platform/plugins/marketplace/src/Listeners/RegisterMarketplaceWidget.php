<?php

namespace HuberwayCMS\Marketplace\Listeners;

use HuberwayCMS\Base\Events\RenderingAdminWidgetEvent;
use HuberwayCMS\Marketplace\Widgets\SaleCommissionHtml;
use HuberwayCMS\Marketplace\Widgets\StoreRevenueTable;

class RegisterMarketplaceWidget
{
    public function handle(RenderingAdminWidgetEvent $event): void
    {
        $event
            ->widget
            ->register([
                SaleCommissionHtml::class,
                StoreRevenueTable::class,
            ], MARKETPLACE_MODULE_SCREEN_NAME);
    }
}
