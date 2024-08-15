<?php

namespace Database\Seeders;

use HuberwayCMS\Ecommerce\Models\StoreLocator;
use HuberwayCMS\Setting\Models\Setting as SettingModel;
use Illuminate\Database\Seeder;

class StoreLocatorSeeder extends Seeder
{
    public function run(): void
    {
        StoreLocator::query()->truncate();

        $storeLocator = StoreLocator::query()->create([
            'name' => 'HuberwayTheme',
            'email' => 'sales@huberway.com',
            'phone' => '1800979769',
            'address' => '502 New Street',
            'state' => 'Brighton VIC',
            'city' => 'Brighton VIC',
            'country' => 'AU',
            'is_primary' => 1,
            'is_shipping_location' => 1,
        ]);

        SettingModel::query()->whereIn('key', [
            'ecommerce_store_name',
            'ecommerce_store_phone',
            'ecommerce_store_address',
            'ecommerce_store_state',
            'ecommerce_store_city',
            'ecommerce_store_country',
        ])->delete();

        SettingModel::query()->insertOrIgnore([
            [
                'key' => 'ecommerce_store_name',
                'value' => $storeLocator->name,
            ],
            [
                'key' => 'ecommerce_store_phone',
                'value' => $storeLocator->phone,
            ],
            [
                'key' => 'ecommerce_store_address',
                'value' => $storeLocator->address,
            ],
            [
                'key' => 'ecommerce_store_state',
                'value' => $storeLocator->state,
            ],
            [
                'key' => 'ecommerce_store_city',
                'value' => $storeLocator->city,
            ],
            [
                'key' => 'ecommerce_store_country',
                'value' => $storeLocator->country,
            ],
        ]);
    }
}
