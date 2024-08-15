<?php

namespace HuberwayCMS\Ecommerce\Repositories\Eloquent;

use HuberwayCMS\Ecommerce\Models\GroupedProduct;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\GroupedProductInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;

class GroupedProductRepository extends RepositoriesAbstract implements GroupedProductInterface
{
    public function getChildren($groupedProductId, array $params)
    {
        return GroupedProduct::getChildren($groupedProductId);
    }

    public function createGroupedProducts($groupedProductId, array $childItems)
    {
        return GroupedProduct::createGroupedProducts($groupedProductId, $childItems);
    }
}
