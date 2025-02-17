<?php

namespace HuberwayCMS\Mollie\Providers;

use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Support\ServiceProvider;

class MollieServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        if (! is_plugin_active('payment')) {
            return;
        }

        $this->setNamespace('plugins/mollie')
            ->loadHelpers()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->publishAssets();

        $this->app->booted(function () {
            $this->app->make('config')->set([
                'mollie.key' => get_payment_setting('api_key', MOLLIE_PAYMENT_METHOD_NAME),
            ]);

            $this->app->register(HookServiceProvider::class);
        });
    }
}
