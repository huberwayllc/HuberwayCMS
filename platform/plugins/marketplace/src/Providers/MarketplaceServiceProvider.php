<?php

namespace HuberwayCMS\Marketplace\Providers;

use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Base\Facades\Form;
use HuberwayCMS\Base\Facades\MacroableModels;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\DashboardMenu as DashboardMenuSupport;
use HuberwayCMS\Base\Supports\Helper;
use HuberwayCMS\Base\Supports\Language;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Ecommerce\Models\Discount;
use HuberwayCMS\Ecommerce\Models\Order;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\PanelSections\SettingEcommercePanelSection;
use HuberwayCMS\LanguageAdvanced\Supports\LanguageAdvancedManager;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Marketplace\Http\Middleware\RedirectIfNotVendor;
use HuberwayCMS\Marketplace\Models\Revenue;
use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Marketplace\Models\VendorInfo;
use HuberwayCMS\Marketplace\Models\Withdrawal;
use HuberwayCMS\Marketplace\Repositories\Eloquent\RevenueRepository;
use HuberwayCMS\Marketplace\Repositories\Eloquent\StoreRepository;
use HuberwayCMS\Marketplace\Repositories\Eloquent\VendorInfoRepository;
use HuberwayCMS\Marketplace\Repositories\Eloquent\WithdrawalRepository;
use HuberwayCMS\Marketplace\Repositories\Interfaces\RevenueInterface;
use HuberwayCMS\Marketplace\Repositories\Interfaces\StoreInterface;
use HuberwayCMS\Marketplace\Repositories\Interfaces\VendorInfoInterface;
use HuberwayCMS\Marketplace\Repositories\Interfaces\WithdrawalInterface;
use HuberwayCMS\SeoHelper\Facades\SeoHelper;
use HuberwayCMS\Slug\Facades\SlugHelper;
use HuberwayCMS\Theme\Facades\SiteMapManager;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Arr;
use Illuminate\Support\ServiceProvider;

class MarketplaceServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        $this->app->bind(StoreInterface::class, function () {
            return new StoreRepository(new Store());
        });

        $this->app->bind(RevenueInterface::class, function () {
            return new RevenueRepository(new Revenue());
        });

        $this->app->bind(WithdrawalInterface::class, function () {
            return new WithdrawalRepository(new Withdrawal());
        });

        $this->app->bind(VendorInfoInterface::class, function () {
            return new VendorInfoRepository(new VendorInfo());
        });

        Helper::autoload(__DIR__ . '/../../helpers');

        $this->app['router']->aliasMiddleware('vendor', RedirectIfNotVendor::class);

        AliasLoader::getInstance()->alias('MarketplaceHelper', MarketplaceHelper::class);
    }

    public function boot(): void
    {
        if (! is_plugin_active('ecommerce')) {
            return;
        }

        add_filter(IS_IN_ADMIN_FILTER, [$this, 'setInAdmin'], 128);

        $this
            ->setNamespace('plugins/marketplace')
            ->loadAndPublishConfigurations(['permissions', 'email', 'general'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->publishAssets()
            ->loadRoutes(['base', 'fronts']);

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Store::class, [
                'name',
                'description',
                'content',
                'address',
                'company',
            ]);
        }

        DashboardMenu::beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-marketplace',
                    'priority' => 0,
                    'parent_id' => null,
                    'name' => 'plugins/marketplace::marketplace.name',
                    'icon' => 'ti ti-building-store',
                    'url' => '#',
                    'permissions' => ['marketplace.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-store',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-marketplace',
                    'name' => 'plugins/marketplace::store.name',
                    'icon' => null,
                    'url' => fn () => route('marketplace.store.index'),
                    'permissions' => ['marketplace.store.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-withdrawal',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-marketplace',
                    'name' => 'plugins/marketplace::withdrawal.name',
                    'icon' => null,
                    'url' => fn () => route('marketplace.withdrawal.index'),
                    'permissions' => ['marketplace.withdrawal.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-marketplace-vendors',
                    'priority' => 4,
                    'parent_id' => 'cms-plugins-marketplace',
                    'name' => 'plugins/marketplace::marketplace.vendors',
                    'icon' => null,
                    'url' => fn () => route('marketplace.vendors.index'),
                    'permissions' => ['marketplace.vendors.index'],
                ])
                ->when(
                    MarketplaceHelper::getSetting('verify_vendor', 1),
                    function (DashboardMenuSupport $dashboardMenu) {
                        $dashboardMenu
                            ->registerItem([
                                'id' => 'cms-plugins-marketplace-unverified-vendor',
                                'priority' => 5,
                                'parent_id' => 'cms-plugins-marketplace',
                                'name' => 'plugins/marketplace::unverified-vendor.name',
                                'icon' => null,
                                'url' => fn () => route('marketplace.unverified-vendors.index'),
                                'permissions' => ['marketplace.unverified-vendors.index'],
                            ]);
                    }
                )
                ->registerItem([
                    'id' => 'cms-plugins-marketplace-reports',
                    'priority' => 0,
                    'parent_id' => 'cms-plugins-marketplace',
                    'name' => 'plugins/marketplace::marketplace.reports.name',
                    'icon' => null,
                    'url' => fn () => route('marketplace.reports.index'),
                    'permissions' => ['marketplace.reports'],
                ]);
        });

        DashboardMenu::for('vendor')->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'marketplace.vendor.dashboard',
                    'priority' => 1,
                    'name' => __('Dashboard'),
                    'url' => fn () => route('marketplace.vendor.dashboard'),
                    'icon' => 'ti ti-home',
                ])
                ->registerItem([
                    'id' => 'marketplace.vendor.products',
                    'priority' => 2,
                    'name' => __('Products'),
                    'url' => fn () => route('marketplace.vendor.products.index'),
                    'icon' => 'ti ti-package',
                ])
                ->registerItem([
                    'id' => 'marketplace.vendor.orders',
                    'priority' => 3,
                    'name' => __('Orders'),
                    'url' => fn () => route('marketplace.vendor.orders.index'),
                    'icon' => 'ti ti-shopping-cart',
                ])
                ->registerItem([
                    'id' => 'marketplace.vendor.discounts',
                    'priority' => 4,
                    'name' => __('Coupons'),
                    'url' => fn () => route('marketplace.vendor.discounts.index'),
                    'icon' => 'ti ti-tag',
                ])
                ->registerItem([
                    'id' => 'marketplace.vendor.withdrawals',
                    'priority' => 5,
                    'name' => __('Withdrawals'),
                    'url' => fn () => route('marketplace.vendor.withdrawals.index'),
                    'icon' => 'ti ti-cash',
                ])
                ->registerItem([
                    'id' => 'marketplace.vendor.revenues',
                    'priority' => 6,
                    'name' => __('Revenues'),
                    'url' => fn () => route('marketplace.vendor.revenues.index'),
                    'icon' => 'ti ti-wallet',
                ])
                ->registerItem([
                    'id' => 'marketplace.vendor.settings',
                    'priority' => 7,
                    'name' => __('Settings'),
                    'url' => fn () => route('marketplace.vendor.settings'),
                    'icon' => 'ti ti-settings',
                ])
                ->registerItem([
                    'id' => 'customer.overview',
                    'priority' => 8,
                    'name' => __('Customer dashboard'),
                    'url' => fn () => route('customer.overview'),
                    'icon' => 'ti ti-user',
                ])
                ->when(EcommerceHelper::isReviewEnabled(), function (DashboardMenuSupport $dashboardMenu) {
                    return $dashboardMenu->registerItem([
                        'id' => 'marketplace.vendor.reviews',
                        'priority' => 5,
                        'name' => __('Reviews'),
                        'url' => fn () => route('marketplace.vendor.reviews.index'),
                        'icon' => 'ti ti-star',
                    ]);
                })
                ->when(EcommerceHelper::isOrderReturnEnabled(), function (DashboardMenuSupport $dashboardMenu) {
                    return $dashboardMenu->registerItem([
                        'id' => 'marketplace.vendor.order-returns',
                        'priority' => 3,
                        'name' => __('Order Returns'),
                        'url' => fn () => route('marketplace.vendor.order-returns.index'),
                        'icon' => 'ti ti-reload',
                    ]);
                })
                ->when(MarketplaceHelper::allowVendorManageShipping(), function (DashboardMenuSupport $dashboardMenu) {
                    return $dashboardMenu->registerItem([
                        'id' => 'marketplace.vendor.shipments',
                        'priority' => 3,
                        'name' => __('Shipments'),
                        'url' => fn () => route('marketplace.vendor.shipments.index'),
                        'icon' => 'ti ti-truck',
                    ]);
                });
        });

        DashboardMenu::for('customer')->beforeRetrieving(function () {
            DashboardMenu::make()
                ->when(auth('customer')->user()->is_vendor, function () {
                    return DashboardMenu::make()
                        ->registerItem([
                            'id' => 'marketplace.vendor.dashboard',
                            'priority' => 990,
                            'name' => __('Vendor Dashboard'),
                            'url' => fn () => route('marketplace.vendor.dashboard'),
                            'icon' => 'ti ti-building-store',
                        ]);
                }, function () {
                    DashboardMenu::make()
                        ->when(MarketplaceHelper::isVendorRegistrationEnabled(), function () {
                            return DashboardMenu::make()
                                ->registerItem([
                                    'id' => 'marketplace.vendor.become-vendor',
                                    'priority' => 991,
                                    'name' => __('Become A Vendor'),
                                    'url' => fn () => route('marketplace.vendor.become-vendor'),
                                    'icon' => 'ti ti-building-store',
                                ]);
                        });
                });
        });

        DashboardMenu::default();

        $this->app['events']->listen(RouteMatched::class, function () {
            if (! MarketplaceHelper::getSetting('verify_vendor', 1)) {
                config([
                    'plugins.marketplace.email.templates' => Arr::except(
                        config('plugins.marketplace.email.templates'),
                        'verify_vendor'
                    ),
                ]);
            }

            EmailHandler::addTemplateSettings(
                MARKETPLACE_MODULE_SCREEN_NAME,
                config('plugins.marketplace.email', [])
            );
        });

        PanelSectionManager::beforeRendering(function () {
            PanelSectionManager::default()->registerItem(
                SettingEcommercePanelSection::class,
                fn () => PanelSectionItem::make('settings.ecommerce.marketplace')
                    ->setTitle(trans('plugins/ecommerce::setting.marketplace.name'))
                    ->withIcon('ti ti-building-store')
                    ->withDescription(trans('plugins/ecommerce::setting.marketplace.description'))
                    ->withPriority(150)
                    ->withRoute('marketplace.settings'),
            );
        });

        SlugHelper::registerModule(Store::class, 'Stores');
        SlugHelper::setPrefix(Store::class, 'stores');

        SeoHelper::registerModule([Store::class]);
        SiteMapManager::registerKey('stores');

        $this->app->register(EventServiceProvider::class);
        $this->app->register(HookServiceProvider::class);
        $this->app->register(OrderSupportServiceProvider::class);

        $this->app['events']->listen('eloquent.deleted: ' . Customer::class, function (Customer $customer) {
            Revenue::query()->where('customer_id', $customer->getKey())->delete();
            Withdrawal::query()->where('customer_id', $customer->getKey())->delete();
            VendorInfo::query()->where('customer_id', $customer->getKey())->delete();
            Store::query()->where('customer_id', $customer->getKey())->each(fn (Store $store) => $store->delete());
        });

        $this->app->booted(function () {
            Customer::resolveRelationUsing('store', function ($model) {
                return $model->hasOne(Store::class)->withDefault();
            });

            Order::resolveRelationUsing('store', function ($model) {
                return $model->belongsTo(Store::class, 'store_id')->withDefault();
            });

            Product::resolveRelationUsing('store', function ($model) {
                return $model->belongsTo(Store::class, 'store_id')->withDefault();
            });

            Product::resolveRelationUsing('approvedBy', function ($model) {
                return $model->belongsTo(User::class, 'approved_by')->withDefault();
            });

            Customer::resolveRelationUsing('vendorInfo', function ($model) {
                return $model->hasOne(VendorInfo::class, 'customer_id')->withDefault();
            });

            Discount::resolveRelationUsing('store', function ($model) {
                return $model->belongsTo(Store::class, 'store_id')->withDefault();
            });

            MacroableModels::addMacro(Customer::class, 'getBalanceAttribute', function () {
                /**
                 * @return float
                 * @var BaseModel $this
                 */
                return $this->vendorInfo ? $this->vendorInfo->balance : 0;
            });

            MacroableModels::addMacro(Customer::class, 'getBankInfoAttribute', function () {
                /**
                 * @return array
                 * @var BaseModel $this
                 */
                return $this->vendorInfo ? $this->vendorInfo->bank_info : [];
            });

            MacroableModels::addMacro(Customer::class, 'getTaxInfoAttribute', function () {
                /**
                 * @return array
                 * @var BaseModel $this
                 */
                return $this->vendorInfo ? $this->vendorInfo->tax_info : [];
            });

            MacroableModels::addMacro(Customer::class, 'getTotalFeeAttribute', function () {
                /**
                 * @return float
                 * @var BaseModel $this
                 */
                return $this->vendorInfo ? $this->vendorInfo->total_fee : 0;
            });

            MacroableModels::addMacro(Customer::class, 'getTotalRevenueAttribute', function () {
                /**
                 * @return float
                 * @var BaseModel $this
                 */
                return $this->vendorInfo ? $this->vendorInfo->total_revenue : 0;
            });

            if (is_plugin_active('language-advanced')) {
                $this->loadRoutes(['language-advanced']);
            }

            $emailVariables = [
                'store' => 'plugins/marketplace::store.store',
                'store_name' => 'plugins/marketplace::store.store_name',
                'store_address' => 'plugins/marketplace::store.store_address',
                'store_phone' => 'plugins/marketplace::store.store_phone',
                'store_url' => 'plugins/marketplace::store.store_url',
            ];

            $emailTemplates = [
                'plugins.ecommerce.email.templates.customer_new_order.variables',
                'plugins.ecommerce.email.templates.admin_new_order.variables',
                'plugins.ecommerce.email.templates.customer_cancel_order.variables',
                'plugins.ecommerce.email.templates.customer_delivery_order.variables',
                'plugins.ecommerce.email.templates.customer_order_delivered.variables',
                'plugins.ecommerce.email.templates.order_confirm.variables',
                'plugins.ecommerce.email.templates.order_confirm_payment.variables',
                'plugins.ecommerce.email.templates.order_recover.variables',
                'plugins.ecommerce.email.templates.order-return-request.variables',
                'plugins.ecommerce.email.templates.invoice-payment-created.variables',
                'plugins.ecommerce.email.templates.review_products.variables',
                'plugins.ecommerce.email.templates.download_digital_products.variables',
            ];

            $config = $this->app['config'];

            foreach ($emailTemplates as $emailTemplate) {
                $config->set([$emailTemplate => array_merge($config->get($emailTemplate, []), $emailVariables)]);
            }
        });

        Form::component('customEditor', MarketplaceHelper::viewPath('vendor-dashboard.forms.partials.custom-editor'), [
            'name',
            'value' => null,
            'attributes' => [],
        ]);

        Form::component('customImage', MarketplaceHelper::viewPath('vendor-dashboard.forms.partials.custom-image'), [
            'name',
            'value' => null,
            'attributes' => [],
        ]);

        Form::component('customImages', MarketplaceHelper::viewPath('vendor-dashboard.forms.partials.custom-images'), [
            'name',
            'values' => null,
            'attributes' => [],
        ]);
    }

    public function setInAdmin(bool $isInAdmin): bool
    {
        $segment = request()->segment(1);

        if ($segment && in_array($segment, Language::getLocaleKeys())) {
            $segment = request()->segment(2);
        }

        return $segment === 'vendor' || $isInAdmin;
    }
}
