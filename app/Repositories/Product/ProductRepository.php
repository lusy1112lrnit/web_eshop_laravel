<?php

namespace App\Repositories\Product;

use App\Models\Product;
use App\Repositories\BaseRepositories;

class ProductRepository extends BaseRepositories implements ProductRepositoryInterface
{
    public function getModel()
    {
        return Product::class;
    }

    public function getRelatedProducts($product, $limit = 4)
    {
        return $this->model->where('product_category_id', $product->product_category_id)
            ->where('tag', $product->tag)
            ->limit($limit)
            ->get();
    }

    

    public function getFeaturedProductsByCategory(int $categoryId)
    {
        return $this->model->where('featured', true)
            ->where('product_category_id', $categoryId)
            ->get();
    }

    public function getProductOnIndex()
    {
        $products = $this->model->paginate(6);

        return $products;
    }

    public function searchAndPaginate($searchQuery, $perPage = 5)
    {
        return Product::where('name', 'like', '%' . $searchQuery . '%')->paginate($perPage);
    }

    public function searchAndPaginateAll($searchQuery, $perPage = 6)
    {
        return Product::where('name', 'like', '%' . $searchQuery . '%')
                    ->orWhere('price', 'like', '%' . $searchQuery . '%')
                    ->orWhereHas('brand', function ($query) use ($searchQuery) {
                        $query->where('name', 'like', '%' . $searchQuery . '%');
                    })
                    ->paginate($perPage);
    }

}