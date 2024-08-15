<?php

use HuberwayCMS\Ecommerce\Http\Controllers\Fronts\PublicCartController;
use HuberwayCMS\Ecommerce\Http\Middleware\CheckCartEnabledMiddleware;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function () {
    Route::middleware(CheckCartEnabledMiddleware::class)
        ->controller(PublicCartController::class)
        ->prefix('cart')
        ->name('public.')
        ->group(function () {
            Route::get('/', 'index')->name('cart');
            Route::post('add-to-cart', 'store')->name('cart.add-to-cart');
            Route::post('update', 'update')->name('cart.update');
            Route::get('remove/{id}', 'destroy')->name('cart.remove');
            Route::get('destroy', 'empty')->name('cart.destroy');
        });
});
