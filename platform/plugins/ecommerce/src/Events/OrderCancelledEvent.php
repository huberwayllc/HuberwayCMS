<?php

namespace HuberwayCMS\Ecommerce\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Order;
use Illuminate\Queue\SerializesModels;

class OrderCancelledEvent extends Event
{
    use SerializesModels;

    public function __construct(public Order $order)
    {
    }
}
