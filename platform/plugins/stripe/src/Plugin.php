<?php

namespace HuberwayCMS\Stripe;

use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use HuberwayCMS\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Setting::delete([
            'payment_stripe_payment_type',
            'payment_stripe_name',
            'payment_stripe_description',
            'payment_stripe_client_id',
            'payment_stripe_secret',
            'payment_stripe_status',
        ]);
    }
}
