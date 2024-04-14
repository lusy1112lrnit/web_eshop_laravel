<?php

namespace App\Service\User;

use App\Repositories\User\UserRepositoryInterface;
use App\Service\BaseService;

class UserService extends BaseService implements UserServiceInterface
{

    public $repository;

    public function __construct(UserRepositoryInterface $userRepository)
    {
        $this -> repository = $userRepository;
    }

    public function getUserOnIndex()
    {
        return $this->repository->getUserOnIndex();
    }
    public function searchAndPaginate($searchQuery, $perPage = 5)
    {
        return $this->repository->searchAndPaginate($searchQuery, $perPage);
    }
}