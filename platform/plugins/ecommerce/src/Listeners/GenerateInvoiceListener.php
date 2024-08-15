<?php

namespace HuberwayCMS\Ecommerce\Listeners;

use HuberwayCMS\Ecommerce\Events\OrderCreated;
use HuberwayCMS\Ecommerce\Events\OrderPlacedEvent;
use HuberwayCMS\Ecommerce\Facades\InvoiceHelper;

class GenerateInvoiceListener
{
    public function handle(OrderPlacedEvent|OrderCreated $event): void
    {
        $order = $event->order;

        InvoiceHelper::store($order);
    }
}
