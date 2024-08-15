<?php

use App\Http\Middleware\VerifyCsrfToken;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Mollie\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::post('mollie/payment/callback', [
        'as' => 'mollie.payment.callback',
        'uses' => 'MollieController@paymentCallback',
    ])->withoutMiddleware(VerifyCsrfToken::class);
});
