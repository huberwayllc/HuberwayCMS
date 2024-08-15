<?php

namespace HuberwayCMS\Ecommerce\Database\Seeders\Traits;

use HuberwayCMS\Ecommerce\Models\ProductCategory;
use HuberwayCMS\Slug\Facades\SlugHelper;
use Illuminate\Support\Arr;

trait HasProductCategorySeeder
{
    protected function createCategoryItem(int $index, array $category, int|string|null $parentId = 0): void
    {
        $category['parent_id'] = $parentId;
        $category['order'] = $index;

        if (Arr::has($category, 'children')) {
            $children = $category['children'];
            unset($category['children']);
        } else {
            $children = [];
        }

        $createdCategory = ProductCategory::query()->create($category);

        SlugHelper::createSlug($createdCategory);

        if ($children) {
            foreach ($children as $childIndex => $child) {
                $this->createCategoryItem($childIndex, $child, $createdCategory->id);
            }
        }
    }
}
