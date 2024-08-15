<?php

namespace HuberwayCMS\Shippo;

use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use HuberwayCMS\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Setting::delete([
            'shipping_shippo_status',
            'shipping_shippo_test_key',
            'shipping_shippo_production_key',
            'shipping_shippo_sandbox',
            'shipping_shippo_logging',
            'shipping_shippo_cache_response',
            'shipping_shippo_webhooks',
        ]);
    }
}
