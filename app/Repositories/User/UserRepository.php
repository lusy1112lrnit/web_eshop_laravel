<?php

namespace App\Repositories\User;

use App\Models\User;
use App\Repositories\BaseRepositories;

class UserRepository extends BaseRepositories implements UserRepositoryInterface
{
    public function getModel()
    {
        return User::class;
    }

    public function getUserOnIndex()
    {
        return $this->model->paginate(5);
    }

    public function searchAndPaginate($searchQuery, $perPage = 5)
    {
        return User::where('name', 'like', '%' . $searchQuery . '%')->paginate($perPage);
    }
}