<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Ads\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'ads', 'as' => 'ads.'], function () {
            Route::resource('', 'AdsController')->parameters(['' => 'ads']);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Theme::registerRoutes(function () {
            Route::get('ads-click/{key}', [
                'as' => 'public.ads-click',
                'uses' => 'PublicController@getAdsClick',
            ]);
        });
    }
});
