<?php

namespace HuberwayCMS\Setting\Providers;

use HuberwayCMS\Base\Events\PanelSectionsRendering;
use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\PanelSections\System\SystemPanelSection;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Setting\Commands\CronJobTestCommand;
use HuberwayCMS\Setting\Facades\Setting;
use HuberwayCMS\Setting\Listeners\PushDashboardMenuToOtherSectionPanel;
use HuberwayCMS\Setting\Models\Setting as SettingModel;
use HuberwayCMS\Setting\PanelSections\SettingCommonPanelSection;
use HuberwayCMS\Setting\PanelSections\SettingOthersPanelSection;
use HuberwayCMS\Setting\Repositories\Eloquent\SettingRepository;
use HuberwayCMS\Setting\Repositories\Interfaces\SettingInterface;
use HuberwayCMS\Setting\Supports\DatabaseSettingStore;
use HuberwayCMS\Setting\Supports\SettingStore;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;

class SettingServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    protected bool $defer = true;

    public function register(): void
    {
        $this
            ->setNamespace('core/setting')
            ->loadAndPublishConfigurations(['general']);

        $this->app->singleton(SettingStore::class, function () {
            return new DatabaseSettingStore();
        });

        $this->app->bind(SettingInterface::class, function () {
            return new SettingRepository(new SettingModel());
        });

        if (! class_exists('Setting')) {
            AliasLoader::getInstance()->alias('Setting', Setting::class);
        }

        $this->loadHelpers();
    }

    public function boot(): void
    {
        $this
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAnonymousComponents()
            ->loadAndPublishTranslations()
            ->loadAndPublishConfigurations(['permissions', 'email'])
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-core-settings',
                    'priority' => 9999,
                    'name' => 'core/setting::setting.title',
                    'icon' => 'ti ti-settings',
                    'route' => 'settings.index',
                ]);
        });

        $events = $this->app['events'];

        $events->listen(RouteMatched::class, function () {
            EmailHandler::addTemplateSettings('base', config('core.setting.email', []), 'core');
        });

        PanelSectionManager::default()
            ->beforeRendering(function () {
                PanelSectionManager::setGroupName(trans('core/setting::setting.title'))
                    ->register([
                        SettingCommonPanelSection::class,
                        SettingOthersPanelSection::class,
                    ]);
            });

        PanelSectionManager::group('system')->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SystemPanelSection::class,
                fn () => PanelSectionItem::make('cronjob')
                    ->setTitle(trans('core/setting::setting.cronjob.name'))
                    ->withIcon('ti ti-calendar-event')
                    ->withDescription(trans('core/setting::setting.cronjob.description'))
                    ->withPriority(50)
                    ->withRoute('settings.cronjob')
            );
        });

        $events->listen(PanelSectionsRendering::class, PushDashboardMenuToOtherSectionPanel::class);

        if ($this->app->runningInConsole()) {
            $this->commands([
                CronJobTestCommand::class,
            ]);

            $this->app->afterResolving(Schedule::class, function (Schedule $schedule) {
                rescue(function () use ($schedule) {
                    $schedule
                        ->command(CronJobTestCommand::class)
                        ->everyMinute();
                });
            });
        }
    }

    public function provides(): array
    {
        return [
            SettingStore::class,
        ];
    }
}
