<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Dashboard\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::get('', [
            'as' => 'dashboard.index',
            'uses' => 'DashboardController@getDashboard',
            'permission' => false,
        ]);

        Route::group(['prefix' => 'widgets', 'permission' => false], function () {
            Route::get('hide', [
                'as' => 'dashboard.hide_widget',
                'uses' => 'DashboardController@getHideWidget',
            ]);

            Route::post('hides', [
                'as' => 'dashboard.hide_widgets',
                'uses' => 'DashboardController@postHideWidgets',
            ]);

            Route::post('order', [
                'as' => 'dashboard.update_widget_order',
                'uses' => 'DashboardController@postUpdateWidgetOrder',
            ]);

            Route::post('setting-item', [
                'as' => 'dashboard.edit_widget_setting_item',
                'uses' => 'DashboardController@postEditWidgetSettingItem',
            ]);
        });
    });
});
