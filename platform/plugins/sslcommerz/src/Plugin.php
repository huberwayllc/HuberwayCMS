<?php

namespace HuberwayCMS\SslCommerz;

use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use HuberwayCMS\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Setting::delete([
            'payment_sslcommerz_name',
            'payment_sslcommerz_description',
            'payment_sslcommerz_store_id',
            'payment_sslcommerz_store_password',
            'payment_sslcommerz_mode',
            'payment_sslcommerz_status',
        ]);
    }
}
