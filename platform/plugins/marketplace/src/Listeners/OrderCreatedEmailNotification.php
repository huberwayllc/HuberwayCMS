<?php

namespace HuberwayCMS\Marketplace\Listeners;

use HuberwayCMS\Ecommerce\Enums\ShippingCodStatusEnum;
use HuberwayCMS\Ecommerce\Enums\ShippingStatusEnum;
use HuberwayCMS\Ecommerce\Events\OrderCreated;
use HuberwayCMS\Ecommerce\Events\OrderPlacedEvent;
use HuberwayCMS\Ecommerce\Models\Shipment;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Payment\Enums\PaymentStatusEnum;
use Illuminate\Support\Arr;

class OrderCreatedEmailNotification
{
    public function handle(OrderCreated|OrderPlacedEvent $event): void
    {
        $storeIds = [];
        $order = $event->order;
        $order->loadMissing(['products', 'products.product']);

        foreach ($order->products as $orderProduct) {
            $product = $orderProduct->product;

            if (! $product) {
                continue;
            }

            if ($product->original_product->store_id && $product->original_product->store->id) {
                $storeIds[] = $product->original_product->store_id;
            }
        }

        if (! count($storeIds)) {
            return;
        }

        $order->store_id = Arr::first($storeIds);
        $order->save();

        Shipment::query()->create([
            'order_id' => $order->getKey(),
            'user_id' => 0,
            'weight' => $order->products_weight,
            'cod_amount' => $order->payment->status != PaymentStatusEnum::COMPLETED ? $order->amount : 0,
            'cod_status' => ShippingCodStatusEnum::PENDING,
            'type' => $order->shipping_method,
            'status' => ShippingStatusEnum::PENDING,
            'price' => $order->shipping_amount,
            'store_id' => $order->store_id,
        ]);

        MarketplaceHelper::sendMailToVendorAfterProcessingOrder($order);
    }
}
