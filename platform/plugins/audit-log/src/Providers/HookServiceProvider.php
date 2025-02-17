<?php

namespace HuberwayCMS\AuditLog\Providers;

use HuberwayCMS\AuditLog\Events\AuditHandlerEvent;
use HuberwayCMS\AuditLog\Facades\AuditLog;
use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Dashboard\Events\RenderingDashboardWidgets;
use HuberwayCMS\Dashboard\Supports\DashboardWidgetInstance;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        add_action(AUTH_ACTION_AFTER_LOGOUT_SYSTEM, [$this, 'handleLogout'], 45, 2);

        add_action(USER_ACTION_AFTER_UPDATE_PASSWORD, [$this, 'handleUpdatePassword'], 45, 3);
        add_action(USER_ACTION_AFTER_UPDATE_PASSWORD, [$this, 'handleUpdateProfile'], 45, 3);

        if (defined('BACKUP_ACTION_AFTER_BACKUP')) {
            add_action(BACKUP_ACTION_AFTER_BACKUP, [$this, 'handleBackup'], 45);
            add_action(BACKUP_ACTION_AFTER_RESTORE, [$this, 'handleRestore'], 45);
        }

        $this->app['events']->listen(RenderingDashboardWidgets::class, function () {
            add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'registerDashboardWidgets'], 28, 2);
        });
    }

    public function handleLogout(Request $request, Model $data): void
    {
        event(new AuditHandlerEvent(
            'of the system',
            'logged out',
            $data->getKey(),
            $data->name,
            'info'
        ));
    }

    public function handleUpdateProfile(string $screen, Request $request, Model $data): void
    {
        event(new AuditHandlerEvent(
            $screen,
            'updated profile',
            $data->getKey(),
            AuditLog::getReferenceName($screen, $data),
            'info'
        ));
    }

    public function handleUpdatePassword(string $screen, Request $request, Model $data): void
    {
        event(new AuditHandlerEvent(
            $screen,
            'changed password',
            $data->getKey(),
            AuditLog::getReferenceName($screen, $data),
            'danger'
        ));
    }

    public function handleBackup(string $screen): void
    {
        event(new AuditHandlerEvent($screen, 'created', 0, '', 'info'));
    }

    public function handleRestore(string $screen): void
    {
        event(new AuditHandlerEvent($screen, 'restored', 0, '', 'info'));
    }

    public function registerDashboardWidgets(array $widgets, Collection $widgetSettings): array
    {
        if (! Auth::guard()->user()->hasPermission('audit-log.index')) {
            return $widgets;
        }

        Assets::addScriptsDirectly('vendor/core/plugins/audit-log/js/audit-log.js');

        return (new DashboardWidgetInstance())
            ->setPermission('audit-log.index')
            ->setKey('widget_audit_logs')
            ->setTitle(trans('plugins/audit-log::history.widget_audit_logs'))
            ->setIcon('fas fa-history')
            ->setColor('cyan')
            ->setRoute(route('audit-log.widget.activities'))
            ->setBodyClass('')
            ->setColumn('col-md-6 col-sm-6')
            ->init($widgets, $widgetSettings);
    }
}
