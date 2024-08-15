<?php

namespace HuberwayCMS\Base\Events;

use HuberwayCMS\Base\Supports\ValueObjects\CoreProduct;
use Illuminate\Foundation\Events\Dispatchable;

class SystemUpdateAvailable
{
    use Dispatchable;

    public function __construct(public CoreProduct $coreProduct)
    {
    }
}
