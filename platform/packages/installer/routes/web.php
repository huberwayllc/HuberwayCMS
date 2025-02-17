<?php

use HuberwayCMS\Installer\Http\Controllers\AccountController;
use HuberwayCMS\Installer\Http\Controllers\EnvironmentController;
use HuberwayCMS\Installer\Http\Controllers\FinalController;
use HuberwayCMS\Installer\Http\Controllers\InstallController;
use HuberwayCMS\Installer\Http\Controllers\LicenseController;
use HuberwayCMS\Installer\Http\Controllers\RequirementController;
use Illuminate\Support\Facades\Route;

Route::group([
    'prefix' => 'install',
    'as' => 'installers.',
    'middleware' => ['web'],
], function () {
    Route::group(['middleware' => 'install'], function () {
        Route::get('welcome', [InstallController::class, 'index'])->name('welcome');
        Route::post('welcome/next', [InstallController::class, 'next'])->name('welcome.next');
        Route::resource('requirements', RequirementController::class)->only(['index']);
        Route::resource('environments', EnvironmentController::class)->only(['index', 'store']);
    });

    Route::group(['middleware' => 'installing'], function () {
        Route::resource('accounts', AccountController::class)->only(['index', 'store']);
        Route::resource('licenses', LicenseController::class)->only(['index', 'store']);
        Route::get('final', [FinalController::class, 'index'])->name('final');

        Route::post('licenses/skip', [LicenseController::class, 'skip'])->name('licenses.skip');
    });
});
