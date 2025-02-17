<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Captcha\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'settings/captcha', 'as' => 'captcha.settings', 'permission' => 'captcha.settings'], function () {
            Route::get('/', [
                'uses' => 'Settings\CaptchaSettingController@edit',
            ]);

            Route::put('/', [
                'as' => '.update',
                'uses' => 'Settings\CaptchaSettingController@update',
            ]);
        });
    });
});
