<?php

namespace HuberwayCMS\Ecommerce\Database\Seeders;

use HuberwayCMS\Base\Supports\BaseSeeder;
use HuberwayCMS\Ecommerce\Enums\DiscountTypeEnum;
use HuberwayCMS\Ecommerce\Enums\DiscountTypeOptionEnum;
use HuberwayCMS\Ecommerce\Models\Discount;
use Illuminate\Support\Str;

class DiscountSeeder extends BaseSeeder
{
    public function run(): void
    {
        Discount::query()->truncate();

        $fake = $this->fake();
        $now = $this->now();

        foreach (range(1, 10) as $index) {
            Discount::create([
                'type' => DiscountTypeEnum::COUPON,
                'title' => sprintf('Discount %s', $index),
                'code' => strtoupper(Str::random(12)),
                'start_date' => $now->clone()->subDay(),
                'end_date' => $fake->boolean() ? $now->clone()->addDays($fake->numberBetween(1, 30)) : null,
                'type_option' => $typeOption = $fake->randomElement(array_values(DiscountTypeOptionEnum::toArray())),
                'value' => match ($typeOption) {
                    DiscountTypeOptionEnum::PERCENTAGE => $fake->numberBetween(1, 100),
                    default => $fake->numberBetween(10, 1000),
                },
            ]);
        }
    }
}
