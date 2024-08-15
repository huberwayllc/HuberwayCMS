<?php

namespace HuberwayCMS\Ecommerce\Services\Products;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Slug\Facades\SlugHelper;

class GetProductBySlugService
{
    public function handle(string $slug, array $params = []): Product|null
    {
        $slug = SlugHelper::getSlug($slug, model: Product::class);

        if (! $slug) {
            return null;
        }

        $condition = [
            'ec_products.id' => $slug->reference_id,
            'ec_products.status' => BaseStatusEnum::PUBLISHED,
        ];

        return get_products(
            [
                'condition' => $condition,
                'take' => 1,
                ...$params,
            ]
        );
    }
}
