<?php

namespace HuberwayCMS\Ecommerce\Repositories\Eloquent;

use HuberwayCMS\Ecommerce\Models\ProductVariation;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductVariationInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;

class ProductVariationRepository extends RepositoriesAbstract implements ProductVariationInterface
{
    public function getVariationByAttributes($configurableProductId, array $attributes)
    {
        return ProductVariation::getVariationByAttributes($configurableProductId, $attributes);
    }

    public function getVariationByAttributesOrCreate($configurableProductId, array $attributes)
    {
        return ProductVariation::getVariationByAttributesOrCreate($configurableProductId, $attributes);
    }

    public function correctVariationItems($configurableProductId, array $attributes)
    {
        return ProductVariation::correctVariationItems($configurableProductId, $attributes);
    }

    public function getParentOfVariation($variationId, array $with = [])
    {
        return ProductVariation::getParentOfVariation($variationId, $with);
    }

    public function getAttributeIdsOfChildrenProduct($productId)
    {
        return ProductVariation::getAttributeIdsOfChildrenProduct($productId);
    }
}
