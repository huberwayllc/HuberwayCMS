<?php

namespace HuberwayCMS\PayPal;

use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use HuberwayCMS\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Setting::delete([
            'payment_paypal_name',
            'payment_paypal_description',
            'payment_paypal_client_id',
            'payment_paypal_client_secret',
            'payment_paypal_mode',
            'payment_paypal_status',
        ]);
    }
}
