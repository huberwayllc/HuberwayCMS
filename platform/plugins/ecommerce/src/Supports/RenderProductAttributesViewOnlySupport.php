<?php

namespace HuberwayCMS\Ecommerce\Supports;

use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\Models\ProductAttributeSet;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductInterface;
use Illuminate\View\View;

class RenderProductAttributesViewOnlySupport
{
    public function __construct(
        protected Product $product,
        protected ProductAttributeSet $productAttributeSet,
        protected ProductInterface $productRepository
    ) {
    }

    public function render(array $options = []): View
    {
        $product = $this->product;
        $attributeSet = $this->productAttributeSet;

        $view = 'plugins/ecommerce::themes.attributes.attributes-view-only';

        $options = apply_filters('ecommerce_render_product_attributes_view_only_options_before', $options);

        if (isset($options['view'])) {
            $view = $options['view'];
        }

        $options = apply_filters('ecommerce_render_product_attributes_view_only_options_after', $options);

        $attributes = $this
            ->productRepository
            ->getRelatedProductAttributes($product)
            ->where('attribute_set_id', $attributeSet->getKey())->sortBy('order');

        return view($view, compact('attributes', 'attributeSet'));
    }
}
