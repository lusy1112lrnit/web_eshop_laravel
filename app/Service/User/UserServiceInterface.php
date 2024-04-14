<?php

namespace App\Service\User;

use App\Service\ServiceInterface;

interface UserServiceInterface extends ServiceInterface
{
    public function all();
    public function find(int $id);
    public function create(array $data);
    public function update(array $data, $id);
    public function delete($id);
    public function getUserOnIndex();
    public function searchAndPaginate($searchQuery, $perPage = 5);

}