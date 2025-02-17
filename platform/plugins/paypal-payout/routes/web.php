<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['namespace' => 'HuberwayCMS\PayPalPayout\Http\Controllers'], function () {
        Route::post('paypal-payout/make/{withdrawalId}', 'PayPalPayoutController@make')->name('paypal-payout.make');
        Route::get('paypal-payout/retrieve/{batchId}', 'PayPalPayoutController@retrieve')->name(
            'paypal-payout.retrieve'
        );
    });
});
