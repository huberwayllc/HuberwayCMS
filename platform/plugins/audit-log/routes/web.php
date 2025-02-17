<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\AuditLog\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'audit-logs'], function () {
            Route::resource('', 'AuditLogController', ['names' => 'audit-log'])->only(['index', 'destroy']);

            Route::get('widgets/activities', [
                'as' => 'audit-log.widget.activities',
                'uses' => 'AuditLogController@getWidgetActivities',
                'permission' => 'audit-log.index',
            ]);

            Route::get('items/empty', [
                'as' => 'audit-log.empty',
                'uses' => 'AuditLogController@deleteAll',
                'permission' => 'audit-log.destroy',
            ]);
        });
    });
});
