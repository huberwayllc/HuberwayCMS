<?php

namespace HuberwayCMS\Ecommerce\Repositories\Interfaces;

use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;

interface GroupedProductInterface extends RepositoryInterface
{
    public function getChildren($groupedProductId, array $params);

    public function createGroupedProducts($groupedProductId, array $childItems);
}
