<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Page\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'pages', 'as' => 'pages.'], function () {
            Route::resource('', 'PageController')->parameters(['' => 'page']);
        });
    });
});
