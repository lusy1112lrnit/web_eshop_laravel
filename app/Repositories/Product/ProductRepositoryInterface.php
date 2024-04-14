<?php

namespace App\Repositories\Product;

use App\Repositories\RepositoriesInterface;
interface ProductRepositoryInterface extends RepositoriesInterface 
{
    public function getRelatedProducts($product, $limit = 4);
    public function getFeaturedProductsByCategory(int $categoryId);
    public function getProductOnIndex();
    public function searchAndPaginate($searchQuery, $perPage = 5);
    public function searchAndPaginateAll($searchQuery, $perPage = 6);
}

