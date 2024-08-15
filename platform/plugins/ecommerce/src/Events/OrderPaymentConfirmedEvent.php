<?php

namespace HuberwayCMS\Ecommerce\Events;

use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Order;
use Illuminate\Queue\SerializesModels;

class OrderPaymentConfirmedEvent extends Event
{
    use SerializesModels;

    public function __construct(public Order $order, public User $confirmedBy)
    {
    }
}
