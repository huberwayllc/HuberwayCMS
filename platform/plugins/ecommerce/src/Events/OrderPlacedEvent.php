<?php

namespace HuberwayCMS\Ecommerce\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Order;
use Illuminate\Queue\SerializesModels;

class OrderPlacedEvent extends Event
{
    use SerializesModels;

    public function __construct(public Order $order)
    {
    }
}
