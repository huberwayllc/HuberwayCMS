<?php

use HuberwayCMS\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'HuberwayCMS\Ecommerce\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'ecommerce/invoices', 'as' => 'ecommerce.invoice.'], function () {
            Route::resource('', 'InvoiceController')
                ->parameters(['' => 'invoice'])
                ->except(['create', 'store', 'update']);

            Route::get('generate-invoice/{invoice}', [
                'as' => 'generate-invoice',
                'uses' => 'InvoiceController@getGenerateInvoice',
                'permission' => 'ecommerce.invoice.edit',
            ])->wherePrimaryKey('invoice');

            Route::get('generate-invoices', [
                'as' => 'generate-invoices',
                'uses' => 'InvoiceController@generateInvoices',
                'permission' => 'ecommerce.invoice.edit',
            ]);
        });
    });
});
