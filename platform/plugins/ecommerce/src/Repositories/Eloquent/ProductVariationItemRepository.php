<?php

namespace HuberwayCMS\Ecommerce\Repositories\Eloquent;

use HuberwayCMS\Ecommerce\Models\ProductVariationItem;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductVariationItemInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;

class ProductVariationItemRepository extends RepositoriesAbstract implements ProductVariationItemInterface
{
    public function getVariationsInfo(array $versionIds)
    {
        return ProductVariationItem::getVariationsInfo($versionIds);
    }

    public function getProductAttributes($productId)
    {
        return ProductVariationItem::getProductAttributes($productId);
    }
}
