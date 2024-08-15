<?php

namespace Database\Seeders;

use HuberwayCMS\Base\Supports\BaseSeeder;
use HuberwayCMS\Setting\Facades\Setting;
use HuberwayCMS\Theme\Facades\ThemeOption;
use Carbon\Carbon;

class ThemeOptionSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('general');

        Setting::newQuery()->where('key', 'LIKE', ThemeOption::getOptionKey('%'))->delete();

        Setting::set(ThemeOption::prepareFromArray([
            'site_title' => 'HuberwayCMS - HuberwayCMS - Laravel Based',
            'seo_description' => 'HuberwayCMS is a clean & modern HuberwayCMS - Laravel Based for multipurpose online stores. With design clean and trendy, HuberwayCMS will make your online store look more impressive and attractive to viewers.',
            'copyright' => sprintf('© %d HuberwayCMS. All Rights Reserved.', Carbon::now()->year),
            'favicon' => 'general/icona-huberway-colore.png',
            'logo' => 'general/logo-huberway-colore.png',
            'welcome_message' => 'Welcome to HuberwayCMS Online Shopping Store!',
            'address' => '502 New Street, Brighton VIC, Australia',
            'hotline' => '1800 97 97 69',
            'email' => 'contact@huberwaytheme.co',
            'newsletter_image' => 'general/newsletter.jpg',
            'homepage_id' => '1',
            'blog_page_id' => '6',
            'cookie_consent_message' => 'Your experience on this site will be improved by allowing cookies ',
            'cookie_consent_learn_more_url' => '/cookie-policy',
            'cookie_consent_learn_more_text' => 'Cookie Policy',
            'number_of_products_per_page' => 42,
            'product_feature_1_title' => 'Shipping worldwide',
            'product_feature_1_icon' => 'icon-network',
            'product_feature_2_title' => 'Free 7-day return if eligible, so easy',
            'product_feature_2_icon' => 'icon-3d-rotate',
            'product_feature_3_title' => 'Supplier give bills for this product.',
            'product_feature_3_icon' => 'icon-receipt',
            'product_feature_4_title' => 'Pay online or when receiving goods',
            'product_feature_4_icon' => 'icon-credit-card',
            'contact_info_box_1_title' => 'Contact Directly',
            'contact_info_box_1_subtitle' => 'contact@huberwaytheme.com',
            'contact_info_box_1_details' => '(+004) 912-3548-07',
            'contact_info_box_2_title' => 'Headquarters',
            'contact_info_box_2_subtitle' => '17 Queen St, South bank, Melbourne 10560, Australia',
            'contact_info_box_2_details' => '',
            'contact_info_box_3_title' => 'Work With Us',
            'contact_info_box_3_subtitle' => 'Send your CV to our email:',
            'contact_info_box_3_details' => 'career@huberwaytheme.com',
            'contact_info_box_4_title' => 'Customer Service',
            'contact_info_box_4_subtitle' => 'customercare@huberwaytheme.com',
            'contact_info_box_4_details' => '(800) 843-2446',
            'contact_info_box_5_title' => 'Media Relations',
            'contact_info_box_5_subtitle' => 'media@huberwaytheme.com',
            'contact_info_box_5_details' => '(801) 947-3564',
            'contact_info_box_6_title' => 'Vendor Support',
            'contact_info_box_6_subtitle' => 'vendorsupport@huberwaytheme.com',
            'contact_info_box_6_details' => '(801) 947-3100',
            'number_of_cross_sale_product' => 7,
            'logo_in_the_checkout_page' => 'general/logo-huberway-colore.png',
            'logo_in_invoices' => 'general/logo-huberway-colore.png',
            'logo_vendor_dashboard' => 'general/logo-huberway-colore.png',
            'primary_font' => 'Work Sans',
            'payment_methods' => [
                'general/payment-method-1.jpg',
                'general/payment-method-2.jpg',
                'general/payment-method-3.jpg',
                'general/payment-method-4.jpg',
                'general/payment-method-5.jpg',
            ],
        ]));

        $socials = [
            [
                'name' => 'Facebook',
                'url' => 'https://www.facebook.com/',
                'icon' => 'fab fa-facebook',
                'color' => '#3b5999',
            ],
            [
                'name' => 'Twitter',
                'url' => 'https://www.twitter.com/',
                'icon' => 'fab fa-twitter',
                'color' => '#55ACF9',
            ],
            [
                'name' => 'Instagram',
                'url' => 'https://www.instagram.com/',
                'icon' => 'fab fa-instagram',
                'color' => '#E1306C',
            ],
            [
                'name' => 'Youtube',
                'url' => 'https://www.youtube.com/',
                'icon' => 'fab fa-youtube',
                'color' => '#FF0000',
            ],
        ];

        $socialLinks = [];

        foreach ($socials as $index => $social) {
            foreach ($social as $key => $value) {
                $socialLinks['social-' . $key . '-' . ($index + 1)] = $value;
            }
        }

        Setting::set(ThemeOption::prepareFromArray($socialLinks));

        Setting::save();
    }
}
