<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Theme\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        if (config('packages.theme.general.display_theme_manager_in_admin_panel', true)) {
            Route::group(['prefix' => 'theme'], function () {
                Route::get('all', [
                    'as' => 'theme.index',
                    'uses' => 'ThemeController@index',
                ]);

                Route::post('active', [
                    'as' => 'theme.active',
                    'uses' => 'ThemeController@postActivateTheme',
                    'permission' => 'theme.index',
                ]);

                Route::post('remove', [
                    'as' => 'theme.remove',
                    'uses' => 'ThemeController@postRemoveTheme',
                    'middleware' => 'preventDemo',
                    'permission' => 'theme.index',
                ]);
            });
        }

        Route::group(['prefix' => 'theme/options'], function () {
            Route::get('', [
                'as' => 'theme.options',
                'uses' => 'ThemeController@getOptions',
            ]);

            Route::post('', [
                'as' => 'theme.options.post',
                'uses' => 'ThemeController@postUpdate',
                'permission' => 'theme.options',
            ]);
        });

        Route::group(['prefix' => 'theme/custom-css'], function () {
            Route::get('', [
                'as' => 'theme.custom-css',
                'uses' => 'ThemeController@getCustomCss',
            ]);

            Route::post('', [
                'as' => 'theme.custom-css.post',
                'uses' => 'ThemeController@postCustomCss',
                'permission' => 'theme.custom-css',
                'middleware' => 'preventDemo',
            ]);
        });

        Route::group(['prefix' => 'theme/custom-js'], function () {
            Route::get('', [
                'as' => 'theme.custom-js',
                'uses' => 'ThemeController@getCustomJs',
            ]);

            Route::post('', [
                'as' => 'theme.custom-js.post',
                'uses' => 'ThemeController@postCustomJs',
                'permission' => 'theme.custom-js',
                'middleware' => 'preventDemo',
            ]);
        });

        Route::group(['prefix' => 'theme/custom-html'], function () {
            Route::get('', [
                'as' => 'theme.custom-html',
                'uses' => 'ThemeController@getCustomHtml',
            ]);

            Route::post('', [
                'as' => 'theme.custom-html.post',
                'uses' => 'ThemeController@postCustomHtml',
                'permission' => 'theme.custom-html',
                'middleware' => 'preventDemo',
            ]);
        });
    });
});
