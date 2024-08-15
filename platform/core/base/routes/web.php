<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use HuberwayCMS\Base\Http\Controllers\CacheManagementController;
use HuberwayCMS\Base\Http\Controllers\CoreIconController;
use HuberwayCMS\Base\Http\Controllers\SearchController;
use HuberwayCMS\Base\Http\Controllers\SystemInformationController;
use HuberwayCMS\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Base\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'system'], function () {
            Route::get('', [
                'as' => 'system.index',
                'uses' => 'SystemController@getIndex',
                'permission' => 'core.system',
            ]);
        });

        Route::group(['permission' => 'superuser'], function () {
            Route::prefix('system/info')->group(function () {
                Route::match(['GET', 'POST'], '/', [SystemInformationController::class, 'index'])
                    ->name('system.info');
                Route::get('get-addition-data', [SystemInformationController::class, 'getAdditionData'])
                    ->middleware(RequiresJsonRequestMiddleware::class)
                    ->name('system.info.get-addition-data');
            });

            Route::prefix('system/cache')->group(function () {
                Route::get('', [CacheManagementController::class, 'index'])->name('system.cache');
                Route::post('clear', [CacheManagementController::class, 'destroy'])
                    ->name('system.cache.clear')
                    ->middleware('preventDemo');
            });
        });

        Route::post('membership/authorize', [
            'as' => 'membership.authorize',
            'uses' => 'SystemController@postAuthorize',
            'permission' => false,
        ]);

        Route::get('menu-items-count', [
            'as' => 'menu-items-count',
            'uses' => 'SystemController@getMenuItemsCount',
            'permission' => false,
        ]);

        Route::get('system/check-update', [
            'as' => 'system.check-update',
            'uses' => 'SystemController@getCheckUpdate',
            'permission' => 'superuser',
        ]);

        Route::get('system/updater', [
            'as' => 'system.updater',
            'uses' => 'SystemController@getUpdater',
            'permission' => 'superuser',
        ]);

        Route::post('system/updater', [
            'as' => 'system.updater.post',
            'uses' => 'SystemController@postUpdater',
            'permission' => 'superuser',
            'middleware' => 'preventDemo',
        ]);

        Route::get('system/cleanup', [
            'as' => 'system.cleanup',
            'uses' => 'SystemController@getCleanup',
            'permission' => 'superuser',
        ]);

        Route::post('system/cleanup', [
            'as' => 'system.cleanup.process',
            'uses' => 'SystemController@getCleanup',
            'permission' => 'superuser',
            'middleware' => 'preventDemo',
        ]);

        Route::post('system/debug-mode/turn-off', [
            'as' => 'system.debug-mode.turn-off',
            'uses' => 'DebugModeController@postTurnOff',
            'permission' => 'superuser',
            'middleware' => 'preventDemo',
        ]);

        Route::get('unlicensed', [
            'as' => 'unlicensed',
            'uses' => 'UnlicensedController@index',
            'permission' => false,
        ]);

        Route::post('unlicensed', [
            'as' => 'unlicensed.skip',
            'uses' => 'UnlicensedController@postSkip',
            'permission' => false,
        ]);

        Route::group(['prefix' => 'notifications', 'as' => 'notifications.', 'permission' => false], function () {
            Route::get('/', [
                'as' => 'index',
                'uses' => 'NotificationController@index',
            ]);

            Route::delete('{id}', [
                'as' => 'destroy',
                'uses' => 'NotificationController@destroy',
            ])->wherePrimaryKey();

            Route::get('read-notification/{id}', [
                'as' => 'read-notification',
                'uses' => 'NotificationController@read',
            ])->wherePrimaryKey();

            Route::put('read-all-notification', [
                'as' => 'read-all-notification',
                'uses' => 'NotificationController@readAll',
            ]);

            Route::delete('destroy-all-notification', [
                'as' => 'destroy-all-notification',
                'uses' => 'NotificationController@deleteAll',
            ]);

            Route::get('count-unread', [
                'as' => 'count-unread',
                'uses' => 'NotificationController@countUnread',
            ]);
        });

        Route::get('toggle-theme-mode', [
            'as' => 'toggle-theme-mode',
            'uses' => 'ToggleThemeModeController@__invoke',
            'permission' => false,
        ]);

        Route::get('search', [SearchController::class, '__invoke'])->name('core.global-search');

        Route::get('core-icons', [CoreIconController::class, 'index'])
            ->name('core-icons')
            ->middleware(RequiresJsonRequestMiddleware::class);
    });
});
