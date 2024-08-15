<?php

namespace Database\Seeders;

use HuberwayCMS\ACL\Database\Seeders\UserSeeder;
use HuberwayCMS\Base\Supports\BaseSeeder;
use HuberwayCMS\Ecommerce\Database\Seeders\CurrencySeeder;
use HuberwayCMS\Ecommerce\Database\Seeders\ReviewSeeder;
use HuberwayCMS\Ecommerce\Database\Seeders\ShippingSeeder;
use HuberwayCMS\Ecommerce\Database\Seeders\TaxSeeder;
use HuberwayCMS\Language\Database\Seeders\LanguageSeeder;

class DatabaseSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->prepareRun();

        $this->call([
            LanguageSeeder::class,
            BrandSeeder::class,
            CurrencySeeder::class,
            ProductCategorySeeder::class,
            ProductCollectionSeeder::class,
            ProductLabelSeeder::class,
            ProductSeeder::class,
            ProductAttributeSeeder::class,
            CustomerSeeder::class,
            ReviewSeeder::class,
            TaxSeeder::class,
            ProductTagSeeder::class,
            FlashSaleSeeder::class,
            ShippingSeeder::class,
            ContactSeeder::class,
            UserSeeder::class,
            BlogSeeder::class,
            SimpleSliderSeeder::class,
            PageSeeder::class,
            AdsSeeder::class,
            FaqSeeder::class,
            SettingSeeder::class,
            StoreLocatorSeeder::class,
            MenuSeeder::class,
            ThemeOptionSeeder::class,
            WidgetSeeder::class,
            ProductOptionSeeder::class,
            MarketplaceSeeder::class,
            OrderEcommerceSeeder::class,
        ]);

        $this->finished();
    }
}
