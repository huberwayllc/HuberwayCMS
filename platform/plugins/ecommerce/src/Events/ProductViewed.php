<?php

namespace HuberwayCMS\Ecommerce\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Product;
use Carbon\CarbonInterface;
use Illuminate\Queue\SerializesModels;

class ProductViewed extends Event
{
    use SerializesModels;

    public function __construct(public Product $product, public CarbonInterface $dateTime)
    {
    }
}
