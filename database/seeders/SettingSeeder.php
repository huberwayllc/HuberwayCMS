<?php

namespace Database\Seeders;

use HuberwayCMS\Base\Supports\BaseSeeder;
use HuberwayCMS\Blog\Models\Category;
use HuberwayCMS\Blog\Models\Post;
use HuberwayCMS\Setting\Facades\Setting;
use HuberwayCMS\Slug\Facades\SlugHelper;
use HuberwayCMS\Slug\Models\Slug;
use HuberwayCMS\Theme\Facades\Theme;

class SettingSeeder extends BaseSeeder
{
    public function run(): void
    {
        $settings = [
            'show_admin_bar' => '1',
            'theme' => Theme::getThemeName(),
            'media_random_hash' => md5((string)time()),
            'admin_favicon' => 'general/icona-huberway-colore.png',
            'admin_logo' => 'general/logo-huberway-white.png',
            SlugHelper::getPermalinkSettingKey(Post::class) => 'blog',
            SlugHelper::getPermalinkSettingKey(Category::class) => 'blog',
            'payment_cod_status' => 1,
            'payment_cod_description' => 'Please pay money directly to the postman, if you choose cash on delivery method (COD).',
            'payment_bank_transfer_status' => 1,
            'payment_bank_transfer_description' => 'Please send money to our bank account: ACB - 69270 213 19.',
            'payment_stripe_payment_type' => 'stripe_checkout',
            'plugins_ecommerce_customer_new_order_status' => 0,
            'plugins_ecommerce_admin_new_order_status' => 0,
            'ecommerce_is_enabled_support_digital_products' => 1,
            'ecommerce_load_countries_states_cities_from_location_plugin' => 0,
            'payment_bank_transfer_display_bank_info_at_the_checkout_success_page' => 1,
            'ecommerce_product_sku_format' => 'MF-2443-[%S]',
        ];

        Setting::delete(array_keys($settings));

        Setting::set($settings)->save();

        Slug::query()->where('reference_type', Post::class)->update(['prefix' => 'blog']);
        Slug::query()->where('reference_type', Category::class)->update(['prefix' => 'blog']);
    }
}
