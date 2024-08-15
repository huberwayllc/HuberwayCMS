<?php

namespace HuberwayCMS\Marketplace\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Customer;
use Illuminate\Queue\SerializesModels;

class NewVendorRegistered extends Event
{
    use SerializesModels;

    public function __construct(public Customer $customer)
    {
    }
}
