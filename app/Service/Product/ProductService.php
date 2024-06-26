<?php

namespace App\Service\Product;

use App\Repositories\Product\ProductRepositoryInterface;
use App\Service\BaseService;

class ProductService extends BaseService implements ProductServiceInterface
{
    public $repository;

    public function __construct(ProductRepositoryInterface $productRepository)
    {
            $this -> repository = $productRepository;
    }

    public function find(int $id)
    {
        $product = $this -> repository -> find($id);
        
        $avgRating = 0;
        $sumRating = array_sum(array_column($product -> productComments->toArray(),'rating'));
        $countRating = count($product->productComments);
        if($countRating != 0){
            $avgRating = $sumRating/$countRating;
        }

        $product -> avgRating = $avgRating;

        return $product;
    }
    
    public function getRelatedProducts($product, $limit = 4)
    {
        return $this->repository->getRelatedProducts($product, $limit);
    }

    public function getFeaturedProducts()
    {
        return [
            "ios" => $this->repository->getFeaturedProductsByCategory(1),
            "android" => $this->repository->getFeaturedProductsByCategory(2),
        ];
    }

    public function getProductOnIndex()
    {
        return $this->repository->getProductOnIndex();
    }

    public function searchAndPaginate($searchQuery, $perPage = 5)
    {
        return $this->repository->searchAndPaginate($searchQuery, $perPage);
    }
    public function searchAndPaginateAll($searchQuery, $perPage = 6)
    {
        return $this->repository->searchAndPaginateAll($searchQuery, $perPage);
    }
}
