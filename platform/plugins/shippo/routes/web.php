<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Shippo\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group([
            'prefix' => 'shipments/shippo',
            'as' => 'ecommerce.shipments.shippo.',
            'permission' => 'ecommerce.shipments.index',
        ], function () {
            Route::controller('ShippoController')->group(function () {
                Route::get('show/{id}', [
                    'as' => 'show',
                    'uses' => 'show',
                ]);

                Route::post('transactions/create/{id}', [
                    'as' => 'transactions.create',
                    'uses' => 'createTransaction',
                    'permission' => 'ecommerce.shipments.edit',
                ]);

                Route::get('rates/{id}', [
                    'as' => 'rates',
                    'uses' => 'getRates',
                ]);

                Route::post('update-rate/{id}', [
                    'as' => 'update-rate',
                    'uses' => 'updateRate',
                    'permission' => 'ecommerce.shipments.edit',
                ]);

                Route::get('view-logs/{file}', [
                    'as' => 'view-log',
                    'uses' => 'viewLog',
                ]);
            });

            Route::group(['prefix' => 'settings', 'as' => 'settings.'], function () {
                Route::post('update', [
                    'as' => 'update',
                    'uses' => 'ShippoSettingController@update',
                    'middleware' => 'preventDemo',
                    'permission' => 'shipping_methods.index',
                ]);
            });
        });
    });

    if (is_plugin_active('marketplace')) {
        Theme::registerRoutes(function () {
            Route::group([
                'prefix' => 'vendor',
                'as' => 'marketplace.vendor.',
                'middleware' => ['vendor'],
            ], function () {
                Route::group(['prefix' => 'orders', 'as' => 'orders.'], function () {
                    Route::group(['prefix' => 'shippo', 'as' => 'shippo.'], function () {
                        Route::controller('ShippoController')->group(function () {
                            Route::get('show/{id}', [
                                'as' => 'show',
                                'uses' => 'show',
                            ]);

                            Route::post('transactions/create/{id}', [
                                'as' => 'transactions.create',
                                'uses' => 'createTransaction',
                            ]);

                            Route::get('rates/{id}', [
                                'as' => 'rates',
                                'uses' => 'getRates',
                            ]);

                            Route::post('update-rate/{id}', [
                                'as' => 'update-rate',
                                'uses' => 'updateRate',
                            ]);
                        });
                    });
                });
            });
        });
    }
});

Route::group([
    'namespace' => 'HuberwayCMS\Shippo\Http\Controllers',
    'prefix' => 'shippo',
    'middleware' => ['api', 'shippo.webhook'],
    'as' => 'shippo.',
], function () {
    Route::controller('ShippoWebhookController')->group(function () {
        Route::post('webhooks', [
            'uses' => 'index',
            'as' => 'webhooks',
        ]);
    });
});
