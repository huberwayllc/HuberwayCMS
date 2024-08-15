<?php

namespace HuberwayCMS\Ecommerce\Repositories\Eloquent;

use HuberwayCMS\Ecommerce\Models\ProductAttributeSet;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductAttributeSetInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class ProductAttributeSetRepository extends RepositoriesAbstract implements ProductAttributeSetInterface
{
    public function getByProductId(int|array|string|null $productId): Collection
    {
        return ProductAttributeSet::getByProductId($productId);
    }

    public function getAllWithSelected(int|array|string|null $productId, array $with = []): Collection
    {
        return ProductAttributeSet::getAllWithSelected($productId, $with);
    }
}
