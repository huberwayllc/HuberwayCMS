<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Route::group(
    ['namespace' => 'HuberwayCMS\Ecommerce\Http\Controllers\Customers'],
    function () {
        AdminHelper::registerRoutes(function () {
            Route::group(['prefix' => 'customers', 'as' => 'customers.'], function () {
                Route::resource('', 'CustomerController')->parameters(['' => 'customer']);

                Route::group(['prefix' => 'addresses', 'as' => 'addresses.'], function () {
                    Route::resource('', 'AddressController')->parameters(['' => 'address'])->except(['index']);
                });
            });

            Route::group(['prefix' => 'customers', 'as' => 'customers.'], function () {
                Route::get('get-list-customers-for-select', [
                    'as' => 'get-list-customers-for-select',
                    'uses' => 'CustomerController@getListCustomerForSelect',
                    'permission' => 'customers.index',
                ]);

                Route::get('get-list-customers-for-search', [
                    'as' => 'get-list-customers-for-search',
                    'uses' => 'CustomerController@getListCustomerForSearch',
                    'permission' => ['customers.index', 'orders.index'],
                ]);

                Route::post('update-email/{id}', [
                    'as' => 'update-email',
                    'uses' => 'CustomerController@postUpdateEmail',
                    'permission' => 'customers.edit',
                ])->wherePrimaryKey();

                Route::get('get-customer-addresses/{id}', [
                    'as' => 'get-customer-addresses',
                    'uses' => 'CustomerController@getCustomerAddresses',
                    'permission' => ['customers.index', 'orders.index'],
                ])->wherePrimaryKey();

                Route::get('get-customer-order-numbers/{id}', [
                    'as' => 'get-customer-order-numbers',
                    'uses' => 'CustomerController@getCustomerOrderNumbers',
                    'permission' => ['customers.index', 'orders.index'],
                ])->wherePrimaryKey();

                Route::post('create-customer-when-creating-order', [
                    'as' => 'create-customer-when-creating-order',
                    'uses' => 'CustomerController@postCreateCustomerWhenCreatingOrder',
                    'permission' => ['customers.index', 'orders.index'],
                ]);

                Route::post('verify-email/{id}', [
                    'as' => 'verify-email',
                    'uses' => 'CustomerController@verifyEmail',
                    'permission' => 'customers.index',
                ])->wherePrimaryKey();

                Route::post('reviews/{id}', [
                    'as' => 'ajax.reviews',
                    'uses' => 'CustomerController@ajaxReviews',
                    'permission' => 'customers.edit',
                ])->wherePrimaryKey();
            });
        });
    }
);

if (defined('THEME_MODULE_SCREEN_NAME')) {
    Theme::registerRoutes(function () {
        Route::group([
            'namespace' => 'HuberwayCMS\Ecommerce\Http\Controllers\Customers',
            'middleware' => ['customer.guest'],
            'as' => 'customer.',
        ], function () {
            Route::get('login', 'LoginController@showLoginForm')->name('login');
            Route::post('login', 'LoginController@login')->name('login.post');

            Route::get('register', 'RegisterController@showRegistrationForm')->name('register');
            Route::post('register', 'RegisterController@register')->name('register.post');

            Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail')->name('password.request');
            Route::post('password/reset', 'ResetPasswordController@reset')->name('password.reset.post');
            Route::get('password/reset', 'ForgotPasswordController@showLinkRequestForm')->name('password.reset');
            Route::get('password/reset/{token}', 'ResetPasswordController@showResetForm')
                ->name('password.reset.update');
        });

        Route::group([
            'namespace' => 'HuberwayCMS\Ecommerce\Http\Controllers\Customers',
            'middleware' => [
                'web',
                'core',
                EcommerceHelper::isEnableEmailVerification() ? 'customer' : 'customer.guest',
            ],
            'as' => 'customer.',
        ], function () {
            Route::get('register/confirm/resend', 'RegisterController@resendConfirmation')
                ->name('resend_confirmation');
            Route::get('register/confirm/{user}', 'RegisterController@confirm')
                ->name('confirm');
        });

        Route::group([
            'namespace' => 'HuberwayCMS\Ecommerce\Http\Controllers\Customers',
            'middleware' => ['customer'],
            'prefix' => 'customer',
            'as' => 'customer.',
        ], function () {
            Route::get('logout', 'LoginController@logout')->name('logout');

            Route::get('overview', [
                'as' => 'overview',
                'uses' => 'PublicController@getOverview',
            ]);

            Route::get('edit-account', [
                'as' => 'edit-account',
                'uses' => 'PublicController@getEditAccount',
            ]);

            Route::post('edit-account', [
                'as' => 'edit-account.post',
                'uses' => 'PublicController@postEditAccount',
            ]);

            Route::get('change-password', [
                'as' => 'change-password',
                'uses' => 'PublicController@getChangePassword',
            ]);

            Route::post('change-password', [
                'as' => 'post.change-password',
                'uses' => 'PublicController@postChangePassword',
            ]);

            Route::get('orders', [
                'as' => 'orders',
                'uses' => 'PublicController@getListOrders',
            ]);

            Route::get('orders/view/{id}', [
                'as' => 'orders.view',
                'uses' => 'PublicController@getViewOrder',
            ])->wherePrimaryKey();

            Route::get('order/cancel/{id}', [
                'as' => 'orders.cancel',
                'uses' => 'PublicController@getCancelOrder',
            ])->wherePrimaryKey();

            Route::get('address', [
                'as' => 'address',
                'uses' => 'PublicController@getListAddresses',
            ]);

            Route::get('address/create', [
                'as' => 'address.create',
                'uses' => 'PublicController@getCreateAddress',
            ]);

            Route::post('address/create', [
                'as' => 'address.create.post',
                'uses' => 'PublicController@postCreateAddress',
            ]);

            Route::get('address/edit/{id}', [
                'as' => 'address.edit',
                'uses' => 'PublicController@getEditAddress',
            ])->wherePrimaryKey();

            Route::post('address/edit/{id}', [
                'as' => 'address.edit.post',
                'uses' => 'PublicController@postEditAddress',
            ])->wherePrimaryKey();

            Route::get('address/delete/{id}', [
                'as' => 'address.destroy',
                'uses' => 'PublicController@getDeleteAddress',
            ])->wherePrimaryKey();

            Route::get('orders/print/{id}', [
                'as' => 'print-order',
                'uses' => 'PublicController@getPrintOrder',
            ])->wherePrimaryKey();

            Route::post('avatar', [
                'as' => 'avatar',
                'uses' => 'PublicController@postAvatar',
            ]);

            Route::get('order-returns', [
                'as' => 'order_returns',
                'uses' => 'PublicController@getListReturnOrders',
            ]);

            Route::get('order-returns/detail/{id}', [
                'as' => 'order_returns.detail',
                'uses' => 'PublicController@getDetailReturnOrder',
            ])->wherePrimaryKey();

            Route::get('order-returns/request/{order_id}', [
                'as' => 'order_returns.request_view',
                'uses' => 'PublicController@getReturnOrder',
            ])->wherePrimaryKey('order_id');

            Route::post('order-returns/send-request', [
                'as' => 'order_returns.send_request',
                'uses' => 'PublicController@postReturnOrder',
            ]);

            Route::get('downloads', [
                'as' => 'downloads',
                'uses' => 'PublicController@getDownloads',
            ]);

            Route::get('download/{id}', [
                'as' => 'downloads.product',
                'uses' => 'PublicController@getDownload',
            ])->wherePrimaryKey();

            Route::group([
                'prefix' => 'invoices',
                'as' => 'invoices.',
            ], function () {
                Route::resource('', 'InvoiceController')
                    ->only('index')
                    ->parameters('invoices');
                Route::get('{id}', 'InvoiceController@show')->name('show')->wherePrimaryKey();
                Route::get('{id}/generate-invoice', 'InvoiceController@getGenerateInvoice')
                    ->name('generate_invoice')
                    ->wherePrimaryKey();
            });

            Route::get('product-reviews', [
                'as' => 'product-reviews',
                'uses' => 'PublicController@getProductReviews',
            ]);

            Route::post('orders/{id}/upload-proof', [
                'as' => 'orders.upload-proof',
                'uses' => 'UploadProofController@upload',
            ])->wherePrimaryKey();

            Route::delete('orders/{id}/download-proof', [
                'as' => 'orders.download-proof',
                'uses' => 'UploadProofController@delete',
            ])->wherePrimaryKey();
        });

        Route::group([
            'namespace' => 'HuberwayCMS\Ecommerce\Http\Controllers\Customers',
            'as' => 'public.',
        ], function () {
            Route::get('digital-products/download/{id}', [
                'as' => 'digital-products.download',
                'uses' => 'PublicController@getDownload',
            ]);
        });
    });
}
