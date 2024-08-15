<?php

namespace HuberwayCMS\Ecommerce\Http\Resources;

use HuberwayCMS\Ecommerce\Models\ProductCategory;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin ProductCategory
 */
class ProductCategoryResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
        ];
    }
}
