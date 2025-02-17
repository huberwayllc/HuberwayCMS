<?php

namespace Database\Seeders;

use HuberwayCMS\Base\Supports\BaseSeeder;
use HuberwayCMS\Ecommerce\Models\FlashSale;
use HuberwayCMS\Ecommerce\Models\Product;
use Illuminate\Support\Facades\DB;

class FlashSaleSeeder extends BaseSeeder
{
    public function run(): void
    {
        FlashSale::query()->truncate();
        DB::table('ec_flash_sale_products')->truncate();

        $flashSale = FlashSale::query()->create([
            'name' => 'Winter Sale',
            'end_date' => now()->addDays(30)->toDateString(),
        ]);

        for ($i = 1; $i <= 10; $i++) {
            $product = Product::query()->where('id', $i)->where('is_variation', 0)->first();

            if (! $product) {
                continue;
            }

            $price = $product->price;

            if ($product->front_sale_price !== $product->price) {
                $price = $product->front_sale_price;
            }

            $flashSale->products()->attach(
                [
                    $i => [
                        'price' => $price - ($price * rand(10, 70) / 100),
                        'quantity' => rand(6, 20),
                        'sold' => rand(1, 5),
                    ],
                ]
            );
        }
    }
}
