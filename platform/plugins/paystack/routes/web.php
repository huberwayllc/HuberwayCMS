<?php

use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Paystack\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::get('paystack/payment/callback', [
        'as' => 'paystack.payment.callback',
        'uses' => 'PaystackController@getPaymentStatus',
    ]);
});
