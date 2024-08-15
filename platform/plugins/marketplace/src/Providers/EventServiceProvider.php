<?php

namespace HuberwayCMS\Marketplace\Providers;

use HuberwayCMS\Base\Events\RenderingAdminWidgetEvent;
use HuberwayCMS\Ecommerce\Events\OrderCreated;
use HuberwayCMS\Marketplace\Events\WithdrawalRequested;
use HuberwayCMS\Marketplace\Listeners\OrderCreatedEmailNotification;
use HuberwayCMS\Marketplace\Listeners\RegisterMarketplaceWidget;
use HuberwayCMS\Marketplace\Listeners\RenderingSiteMapListener;
use HuberwayCMS\Marketplace\Listeners\SaveVendorInformationListener;
use HuberwayCMS\Marketplace\Listeners\WithdrawalRequestedNotification;
use HuberwayCMS\Theme\Events\RenderingSiteMapEvent;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        Registered::class => [
            SaveVendorInformationListener::class,
        ],
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
        OrderCreated::class => [
            OrderCreatedEmailNotification::class,
        ],
        WithdrawalRequested::class => [
            WithdrawalRequestedNotification::class,
        ],
        RenderingAdminWidgetEvent::class => [
            RegisterMarketplaceWidget::class,
        ],
    ];
}
