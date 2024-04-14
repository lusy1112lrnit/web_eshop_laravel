<?php

namespace App\Service\Product;

use App\Service\ServiceInterface;

interface ProductServiceInterface extends ServiceInterface
{
    public function getRelatedProducts($product, $limit = 4);
    public function getFeaturedProducts();
    public function getProductOnIndex();
    public function searchAndPaginate($searchQuery, $perPage = 5);
    public function searchAndPaginateAll($searchQuery, $perPage = 6);
}
