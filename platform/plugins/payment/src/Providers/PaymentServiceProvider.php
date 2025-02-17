<?php

namespace HuberwayCMS\Payment\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Payment\Facades\PaymentMethods;
use HuberwayCMS\Payment\Models\Payment;
use HuberwayCMS\Payment\Repositories\Eloquent\PaymentRepository;
use HuberwayCMS\Payment\Repositories\Interfaces\PaymentInterface;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Support\ServiceProvider;

class PaymentServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this
            ->setNamespace('plugins/payment')
            ->loadHelpers();

        $this->app->singleton(PaymentInterface::class, function () {
            return new PaymentRepository(new Payment());
        });

        $loader = AliasLoader::getInstance();
        $loader->alias('PaymentMethods', PaymentMethods::class);
    }

    public function boot(): void
    {
        $this
            ->loadAndPublishConfigurations(['payment', 'permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAnonymousComponents()
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-payments',
                    'priority' => 3,
                    'parent_id' => null,
                    'name' => 'plugins/payment::payment.name',
                    'icon' => 'ti ti-credit-card',
                    'url' => fn () => route('payment.index'),
                    'permissions' => ['payment.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-payments-all',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-payments',
                    'name' => 'plugins/payment::payment.transactions',
                    'icon' => null,
                    'url' => fn () => route('payment.index'),
                    'permissions' => ['payment.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-payment-methods',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-payments',
                    'name' => 'plugins/payment::payment.payment_methods',
                    'icon' => null,
                    'url' => fn () => route('payments.methods'),
                    'permissions' => ['payments.settings'],
                ]);
        });
    }
}
