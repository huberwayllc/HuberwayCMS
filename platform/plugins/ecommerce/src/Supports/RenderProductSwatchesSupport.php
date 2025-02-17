<?php

namespace HuberwayCMS\Ecommerce\Supports;

use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\Models\ProductVariation;
use HuberwayCMS\Ecommerce\Models\ProductVariationItem;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductInterface;
use Illuminate\Support\Arr;

class RenderProductSwatchesSupport
{
    protected Product $product;

    public function __construct(protected ProductInterface $productRepository)
    {
    }

    public function setProduct(Product $product): RenderProductSwatchesSupport
    {
        $this->product = $product;

        return $this;
    }

    public function render(array $params = []): string
    {
        $params = array_merge([
            'selected' => [],
            'view' => 'plugins/ecommerce::themes.attributes.swatches-renderer',
        ], $params);

        $product = $this->product;

        $attributeSets = $product->productAttributeSets()->orderBy('order')->get();

        $attributes = $this->productRepository->getRelatedProductAttributes($this->product)->sortBy('order');

        $productVariations = ProductVariation::query()
            ->where('configurable_product_id', $product->getKey())
            ->with(['productAttributes', 'product'])
            ->get();

        $productVariationsInfo = ProductVariationItem::getVariationsInfo($productVariations->pluck('id')->toArray());

        if ($productVariationsInfo->count()) {
            $productVariationsInfo->loadMissing(['productVariation.product']);

            $productVariationsInfo = $productVariationsInfo->reject(function (ProductVariationItem $productVariation) {
                return $productVariation->productVariation->product->isOutOfStock();
            });
        }

        $selected = $params['selected'];

        return view(
            $params['view'],
            [
                ...compact(
                    'attributeSets',
                    'attributes',
                    'product',
                    'selected',
                    'productVariationsInfo',
                    'productVariations'
                ),
                ...Arr::except($params, ['view', 'selected']),
            ]
        )->render();
    }
}
