<?php

namespace HuberwayCMS\Ecommerce\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Order;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class OrderCompletedEvent extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public Order $order)
    {
    }
}
