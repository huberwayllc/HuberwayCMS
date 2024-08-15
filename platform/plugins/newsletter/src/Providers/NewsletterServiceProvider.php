<?php

namespace HuberwayCMS\Newsletter\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Newsletter\Contracts\Factory;
use HuberwayCMS\Newsletter\Models\Newsletter;
use HuberwayCMS\Newsletter\NewsletterManager;
use HuberwayCMS\Newsletter\Repositories\Eloquent\NewsletterRepository;
use HuberwayCMS\Newsletter\Repositories\Interfaces\NewsletterInterface;
use HuberwayCMS\Setting\PanelSections\SettingOthersPanelSection;
use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Routing\Events\RouteMatched;

class NewsletterServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->singleton(NewsletterInterface::class, function () {
            return new NewsletterRepository(new Newsletter());
        });

        $this->app->singleton(Factory::class, function ($app) {
            return new NewsletterManager($app);
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/newsletter')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'email'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadMigrations();

        $this->app->register(EventServiceProvider::class);

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-newsletter',
                    'priority' => 430,
                    'name' => 'plugins/newsletter::newsletter.name',
                    'icon' => 'ti ti-mail',
                    'route' => 'newsletter.index',
                ]);
        });

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('newsletter')
                    ->setTitle(trans('plugins/newsletter::newsletter.settings.title'))
                    ->withIcon('ti ti-mail-cog')
                    ->withDescription(trans('plugins/newsletter::newsletter.settings.panel_description'))
                    ->withPriority(140)
                    ->withRoute('newsletter.settings')
            );
        });

        $this->app['events']->listen(RouteMatched::class, function () {
            EmailHandler::addTemplateSettings(NEWSLETTER_MODULE_SCREEN_NAME, config('plugins.newsletter.email', []));
        });
    }

    public function provides(): array
    {
        return [Factory::class];
    }
}
