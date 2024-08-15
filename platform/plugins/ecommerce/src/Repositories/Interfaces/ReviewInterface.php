<?php

namespace HuberwayCMS\Ecommerce\Repositories\Interfaces;

use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface ReviewInterface extends RepositoryInterface
{
    public function getGroupedByProductId(int|string $productId): Collection;
}
