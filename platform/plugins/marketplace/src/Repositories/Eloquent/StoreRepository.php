<?php

namespace HuberwayCMS\Marketplace\Repositories\Eloquent;

use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Marketplace\Repositories\Interfaces\StoreInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;

class StoreRepository extends RepositoriesAbstract implements StoreInterface
{
    public function handleCommissionEachCategory(array $data): array
    {
        return Store::handleCommissionEachCategory($data);
    }

    public function getCommissionEachCategory(): array
    {
        return Store::getCommissionEachCategory();
    }
}
