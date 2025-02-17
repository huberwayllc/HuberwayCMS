<?php

namespace HuberwayCMS\Marketplace\Database\Seeders\Traits;

use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Marketplace\Models\VendorInfo;
use HuberwayCMS\Slug\Facades\SlugHelper;

trait HasMarketplaceSeeder
{
    protected function createStores(array $data): array
    {
        Customer::query()->where('is_vendor', 1)->update(['is_vendor' => 0]);
        Store::query()->truncate();
        VendorInfo::query()->truncate();

        $faker = $this->fake();

        foreach (Customer::query()->get() as $customer) {
            $customer->is_vendor = $customer->id < 9;
            $customer->vendor_verified_at = $customer->is_vendor ? $this->now() : null;
            $customer->save();

            if ($customer->is_vendor) {
                $vendorInfo = new VendorInfo();
                $vendorInfo->bank_info = [
                    'name' => $faker->name(),
                    'number' => $faker->e164PhoneNumber(),
                    'full_name' => $faker->name(),
                    'description' => $faker->name(),
                ];
                $vendorInfo->customer_id = $customer->id;

                $vendorInfo->save();
            }
        }

        $vendorIds = Customer::query()->where('is_vendor', 1)->pluck('id');

        $stores = [];

        foreach ($data as $item) {
            $item['email'] = $faker->safeEmail();
            $item['phone'] = $faker->e164PhoneNumber();
            $item['country'] = $faker->countryCode();
            $item['state'] = $faker->state();
            $item['city'] = $faker->city();
            $item['address'] = $faker->streetAddress();
            $item['description'] = $faker->text(400);
            $item['customer_id'] = $vendorIds->random();

            $store = Store::query()->create($item);

            $stores[] = $store;

            SlugHelper::createSlug($store);
        }

        $storeIds = Store::query()->pluck('id');

        foreach (Product::query()->where('is_variation', 0)->get() as $product) {
            $product->store_id = $storeIds->random();
            $product->save();
        }

        return $stores;
    }
}
