<?php

namespace App\Repositories\User;

use App\Repositories\RepositoriesInterface;

interface UserRepositoryInterface extends RepositoriesInterface
{

    public function getUserOnIndex();
    public function searchAndPaginate($searchQuery, $perPage = 5);
}