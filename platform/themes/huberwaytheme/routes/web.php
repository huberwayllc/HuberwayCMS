<?php

use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Theme\HuberwayTheme\Http\Controllers\HuberwayThemeController;

Theme::registerRoutes(function () {
    Route::group(['controller' => HuberwayThemeController::class], function () {
        Route::group(['prefix' => 'ajax', 'as' => 'public.ajax.'], function () {
            Route::get('products', 'ajaxGetProducts')
                ->name('products');

            Route::get('cart', 'ajaxCart')
                ->name('cart');

            Route::get('search-products', 'ajaxSearchProducts')
                ->name('search-products');

            Route::post('send-download-app-links', 'ajaxSendDownloadAppLinks')
                ->name('send-download-app-links');

            Route::get('products-by-collection/{id}', 'ajaxGetProductsByCollection')
                ->name('products-by-collection')
                ->wherePrimaryKey();

            Route::get('products-by-category/{id}', 'ajaxGetProductsByCategory')
                ->name('products-by-category')
                ->wherePrimaryKey();
        });
    });
});

Theme::routes();
