<?php

namespace HuberwayCMS\Ecommerce\Listeners;

use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Ecommerce\Events\OrderCompletedEvent;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Order;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductInterface;

class SendProductReviewsMailAfterOrderCompleted
{
    public function handle(OrderCompletedEvent $event): void
    {
        $mailer = EmailHandler::setModule(ECOMMERCE_MODULE_SCREEN_NAME);

        if (EcommerceHelper::isReviewEnabled() && $mailer->templateEnabled('review_products')) {
            $order = $event->order;

            if (get_class($order) == Order::class && ($customer = $order->user) && $customer->id) {
                $products = app(ProductInterface::class)->productsNeedToReviewByCustomer($customer->id, 12, [$order->id]);

                if ($products->count() && $products->loadMissing(['slugable'])) {
                    $mailer
                        ->setVariableValues([
                            'customer_name' => $customer->name,
                            'product_review_list' => view('plugins/ecommerce::emails.partials.product-review-list', compact('products'))->render(),
                        ])
                        ->sendUsingTemplate('review_products', $customer->email);
                }
            }
        }
    }
}
