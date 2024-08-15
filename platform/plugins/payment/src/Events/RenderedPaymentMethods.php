<?php

namespace HuberwayCMS\Payment\Events;

use HuberwayCMS\Base\Events\Event;

class RenderedPaymentMethods extends Event
{
    public function __construct(public string $html)
    {
    }
}
