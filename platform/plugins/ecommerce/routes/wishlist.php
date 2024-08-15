<?php

use HuberwayCMS\Ecommerce\Http\Controllers\Fronts\WishlistController;
use HuberwayCMS\Ecommerce\Http\Middleware\CheckWishlistEnabledMiddleware;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function () {
    Route::middleware(CheckWishlistEnabledMiddleware::class)
        ->controller(WishlistController::class)
        ->prefix('wishlist')
        ->name('public.')
        ->group(function () {
            Route::get('/', 'index')->name('wishlist');
            Route::post('{productId}', 'store')->name('wishlist.add')->wherePrimaryKey('productId');
            Route::delete('{productId}', 'destroy')->name('wishlist.remove')->wherePrimaryKey('productId');
        });
});
