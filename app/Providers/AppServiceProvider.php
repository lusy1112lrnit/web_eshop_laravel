<?php

namespace App\Providers;

use App\Repositories\Product\ProductRepository;
use App\Repositories\Product\ProductRepositoryInterface;
use App\Repositories\User\UserRepository;
use App\Repositories\User\UserRepositoryInterface;
use App\Service\Product\ProductService;
use App\Service\Product\ProductServiceInterface;
use App\Service\User\UserService;
use App\Service\User\UserServiceInterface;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        // Product
        $this -> app -> singleton(
            ProductRepositoryInterface::class,
            ProductRepository::class
        );

        $this -> app -> singleton(
            ProductServiceInterface::class,
            ProductService::class
        );

        //User
        $this->app->singleton(

            UserRepositoryInterface::class,
            UserRepository::class

        );

        $this->app->singleton(

            UserServiceInterface::class,
            UserService::class

        );


    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
