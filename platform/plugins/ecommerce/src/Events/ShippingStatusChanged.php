<?php

namespace HuberwayCMS\Ecommerce\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Shipment;
use Illuminate\Queue\SerializesModels;

class ShippingStatusChanged extends Event
{
    use SerializesModels;

    public function __construct(public Shipment $shipment, public array $previousShipment = [])
    {
    }
}
