<?php

namespace HuberwayCMS\Marketplace\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Marketplace\Models\Withdrawal;
use Illuminate\Queue\SerializesModels;

class WithdrawalRequested extends Event
{
    use SerializesModels;

    public function __construct(public Customer $customer, public Withdrawal $withdrawal)
    {
    }
}
