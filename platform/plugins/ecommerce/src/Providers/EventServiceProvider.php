<?php

namespace HuberwayCMS\Ecommerce\Providers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\RenderingAdminWidgetEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Ecommerce\Events\OrderCancelledEvent;
use HuberwayCMS\Ecommerce\Events\OrderCompletedEvent;
use HuberwayCMS\Ecommerce\Events\OrderCreated;
use HuberwayCMS\Ecommerce\Events\OrderPaymentConfirmedEvent;
use HuberwayCMS\Ecommerce\Events\OrderPlacedEvent;
use HuberwayCMS\Ecommerce\Events\OrderReturnedEvent;
use HuberwayCMS\Ecommerce\Events\ProductQuantityUpdatedEvent;
use HuberwayCMS\Ecommerce\Events\ProductViewed;
use HuberwayCMS\Ecommerce\Events\ShippingStatusChanged;
use HuberwayCMS\Ecommerce\Facades\Cart;
use HuberwayCMS\Ecommerce\Listeners\AddLanguageForVariantsListener;
use HuberwayCMS\Ecommerce\Listeners\ClearShippingRuleCache;
use HuberwayCMS\Ecommerce\Listeners\GenerateInvoiceListener;
use HuberwayCMS\Ecommerce\Listeners\GenerateLicenseCodeAfterOrderCompleted;
use HuberwayCMS\Ecommerce\Listeners\OrderCancelledNotification;
use HuberwayCMS\Ecommerce\Listeners\OrderCreatedNotification;
use HuberwayCMS\Ecommerce\Listeners\OrderPaymentConfirmedNotification;
use HuberwayCMS\Ecommerce\Listeners\OrderReturnedNotification;
use HuberwayCMS\Ecommerce\Listeners\RegisterCodPaymentMethod;
use HuberwayCMS\Ecommerce\Listeners\RegisterEcommerceWidget;
use HuberwayCMS\Ecommerce\Listeners\RenderingSiteMapListener;
use HuberwayCMS\Ecommerce\Listeners\SaveProductFaqListener;
use HuberwayCMS\Ecommerce\Listeners\SendMailsAfterCustomerRegistered;
use HuberwayCMS\Ecommerce\Listeners\SendProductReviewsMailAfterOrderCompleted;
use HuberwayCMS\Ecommerce\Listeners\SendShippingStatusChangedNotification;
use HuberwayCMS\Ecommerce\Listeners\SendWebhookWhenOrderPlaced;
use HuberwayCMS\Ecommerce\Listeners\UpdateProductStockStatus;
use HuberwayCMS\Ecommerce\Listeners\UpdateProductView;
use HuberwayCMS\Ecommerce\Services\HandleApplyCouponService;
use HuberwayCMS\Ecommerce\Services\HandleApplyProductCrossSaleService;
use HuberwayCMS\Ecommerce\Services\HandleRemoveCouponService;
use HuberwayCMS\Payment\Events\RenderingPaymentMethods;
use HuberwayCMS\Theme\Events\RenderingSiteMapEvent;
use Illuminate\Auth\Events\Logout;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Session\SessionManager;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
        CreatedContentEvent::class => [
            AddLanguageForVariantsListener::class,
            ClearShippingRuleCache::class,
            SaveProductFaqListener::class,
        ],
        UpdatedContentEvent::class => [
            AddLanguageForVariantsListener::class,
            ClearShippingRuleCache::class,
            SaveProductFaqListener::class,
        ],
        DeletedContentEvent::class => [
            ClearShippingRuleCache::class,
        ],
        Registered::class => [
            SendMailsAfterCustomerRegistered::class,
        ],
        OrderPlacedEvent::class => [
            SendWebhookWhenOrderPlaced::class,
            GenerateInvoiceListener::class,
            OrderCreatedNotification::class,
        ],
        OrderCreated::class => [
            GenerateInvoiceListener::class,
            OrderCreatedNotification::class,
        ],
        ProductQuantityUpdatedEvent::class => [
            UpdateProductStockStatus::class,
        ],
        OrderCompletedEvent::class => [
            SendProductReviewsMailAfterOrderCompleted::class,
            GenerateLicenseCodeAfterOrderCompleted::class,
        ],
        ProductViewed::class => [
            UpdateProductView::class,
        ],
        ShippingStatusChanged::class => [
            SendShippingStatusChangedNotification::class,
        ],
        RenderingAdminWidgetEvent::class => [
            RegisterEcommerceWidget::class,
        ],
        OrderPaymentConfirmedEvent::class => [
            OrderPaymentConfirmedNotification::class,
        ],
        OrderCancelledEvent::class => [
            OrderCancelledNotification::class,
        ],
        OrderReturnedEvent::class => [
            OrderReturnedNotification::class,
        ],
        RenderingPaymentMethods::class => [
            RegisterCodPaymentMethod::class,
        ],
    ];

    public function boot(): void
    {
        $events = $this->app['events'];

        // Something wrong here, need to remove cart.removed event for now.
        $events->listen(
            ['cart.added', 'cart.updated'],
            fn () => $this->app->make(HandleApplyProductCrossSaleService::class)->handle()
        );

        $events->listen(
            ['cart.removed', 'cart.stored', 'cart.restored', 'cart.updated'],
            function ($cart) {
                $coupon = session('applied_coupon_code');
                if ($coupon) {
                    $this->app->make(HandleRemoveCouponService::class)->execute();
                    if (Cart::count() || ($cart instanceof \HuberwayCMS\Ecommerce\Cart\Cart && $cart->count())) {
                        $this->app->make(HandleApplyCouponService::class)->execute($coupon);
                    }
                }
            }
        );

        $this->app['events']->listen(Logout::class, function () {
            if (get_ecommerce_setting('cart_destroy_on_logout', false)) {
                $this->app->make(SessionManager::class)->forget('cart');
            }
        });
    }
}
