<?php

namespace HuberwayCMS\Ecommerce\Database\Seeders;

use HuberwayCMS\Base\Supports\BaseSeeder;
use HuberwayCMS\Ecommerce\Enums\ShippingRuleTypeEnum;
use HuberwayCMS\Ecommerce\Models\Shipping;
use HuberwayCMS\Ecommerce\Models\ShippingRule;
use HuberwayCMS\Ecommerce\Models\ShippingRuleItem;

class ShippingSeeder extends BaseSeeder
{
    public function run(): void
    {
        Shipping::query()->truncate();
        ShippingRule::query()->truncate();
        ShippingRuleItem::query()->truncate();

        $shipping = Shipping::query()->create(['title' => 'All']);

        ShippingRule::query()->create([
            'name' => 'Free delivery',
            'shipping_id' => $shipping->getKey(),
            'type' => ShippingRuleTypeEnum::BASED_ON_PRICE,
            'from' => 0,
            'to' => null,
            'price' => 0,
        ]);
    }
}
