<?php

namespace HuberwayCMS\Payment\Events;

use HuberwayCMS\Base\Events\Event;

class RenderingPaymentMethods extends Event
{
    public function __construct(public array $methods)
    {
    }
}
