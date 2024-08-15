<?php

namespace HuberwayCMS\Marketplace\Repositories\Interfaces;

use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;

interface StoreInterface extends RepositoryInterface
{
    public function handleCommissionEachCategory(array $data): array;

    public function getCommissionEachCategory(): array;
}
