<?php

use App\Service\Product\ProductServiceInterface;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Front (Client)
Route::get('/', [App\Http\Controllers\Front\HomeController::class, 'index']);

Route::prefix('shop')->group(function(){
    Route::get('product/{id}', [App\Http\Controllers\Front\ShopController::class, 'show']);
    Route::get('/', [App\Http\Controllers\Front\ShopController::class, 'index']);
});

Route::prefix('account')->group(function () {
    Route::get('login', [App\Http\Controllers\Front\AccountController::class, 'login']);
    Route::post('login', [App\Http\Controllers\Front\AccountController::class, 'checkLogin']);
    Route::get('logout', [App\Http\Controllers\Front\AccountController::class, 'logout']);
    Route::get('register', [App\Http\Controllers\Front\AccountController::class, 'register']);
    Route::post('register', [App\Http\Controllers\Front\AccountController::class, 'postRegister']);
});

// Dasboard (Admin)
Route::prefix('admin')->middleware('CheckAdminLogin')->group(function(){
    
    Route::resource('user',App\Http\Controllers\Admin\UserController::class,[]);
    Route::resource('product',App\Http\Controllers\Admin\ProductController::class,[]);


    Route::prefix('login')->group(function () {
        Route::get( '', [App\Http\Controllers\Admin\HomeController::class, 'getLogin'])->withoutMiddleware('CheckAdminLogin');
        Route::post( '', [App\Http\Controllers\Admin\HomeController::class, 'postLogin'])->withoutMiddleware('CheckAdminLogin');
    });

    Route::get( 'logout', [App\Http\Controllers\Admin\HomeController::class, 'logout']);
});