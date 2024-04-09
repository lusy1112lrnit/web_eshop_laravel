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

Route::get('/', [App\Http\Controllers\Front\HomeController::class, 'index']);

// Route::prefix('shop')->group(function(){
    
// });

// Route::get('shop/product/{id}', [App\Http\Controllers\Front\ShopController::class, 'show']);
// Route::get('shop', [App\Http\Controllers\Front\ShopController::class, 'index']);
// Route::get('shop/apple', [App\Http\Controllers\Front\ShopController::class, 'productIOS']);
// Route::get('shop/android', [App\Http\Controllers\Front\ShopController::class, 'productAndroid']);

Route::prefix('shop')->group(function(){
    Route::get('product/{id}', [App\Http\Controllers\Front\ShopController::class, 'show']);
    Route::get('/', [App\Http\Controllers\Front\ShopController::class, 'index']);
    
});

Route::prefix('account')->group(function () {
    Route::get('login', [App\Http\Controllers\Front\AccountController::class, 'login']);
    Route::post('login', [App\Http\Controllers\Front\AccountController::class, 'checkLogin']);
    Route::get('logout', [App\Http\Controllers\Front\AccountController::class, 'logout']);
    Route::get('register', [App\Http\Controllers\Front\AccountController::class, 'register']);
});