<?php

namespace HuberwayCMS\Ecommerce\Listeners;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Ecommerce\Models\Shipping;
use HuberwayCMS\Ecommerce\Models\ShippingRule;
use HuberwayCMS\Ecommerce\Services\HandleShippingFeeService;

class ClearShippingRuleCache
{
    public function __construct(protected HandleShippingFeeService $shippingFeeService)
    {
    }

    public function handle(CreatedContentEvent|UpdatedContentEvent|DeletedContentEvent $event): void
    {
        if (! in_array(get_class($event->data), [Shipping::class, ShippingRule::class])) {
            return;
        }

        $this->shippingFeeService->clearCache();
    }
}
