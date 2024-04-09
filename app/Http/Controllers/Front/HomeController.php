<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Service\Product\ProductServiceInterface;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    //
    private $productService;

    public function __construct(ProductServiceInterface $productServiceInterface) 
    {
        $this->productService = $productServiceInterface;
    }

    public function index()
    {
        $featuredProducts = $this->productService->getFeaturedProducts();

        return view('front.index', compact('featuredProducts'));
    }
}
