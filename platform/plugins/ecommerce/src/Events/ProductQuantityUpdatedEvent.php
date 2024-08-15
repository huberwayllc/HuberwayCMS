<?php

namespace HuberwayCMS\Ecommerce\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Ecommerce\Models\Product;
use Illuminate\Queue\SerializesModels;

class ProductQuantityUpdatedEvent extends Event
{
    use SerializesModels;

    public function __construct(public Product $product)
    {
    }
}
