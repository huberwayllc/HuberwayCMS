<?php

use HuberwayCMS\Ecommerce\Http\Controllers\Fronts\CompareController;
use HuberwayCMS\Ecommerce\Http\Middleware\CheckCompareEnabledMiddleware;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function () {
    Route::middleware(CheckCompareEnabledMiddleware::class)
        ->controller(CompareController::class)
        ->prefix('compare')
        ->name('public.')
        ->group(function () {
            Route::get('/', 'index')->name('compare');
            Route::post('{productId}', 'store')->name('compare.add')->wherePrimaryKey('productId');
            Route::delete('{productId}', 'destroy')->name('compare.remove')->wherePrimaryKey('productId');
        });
});
