<?php

namespace HuberwayCMS\Ecommerce\Repositories\Interfaces;

use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;

interface ProductVariationItemInterface extends RepositoryInterface
{
    public function getVariationsInfo(array $versionIds);

    public function getProductAttributes($productId);
}
