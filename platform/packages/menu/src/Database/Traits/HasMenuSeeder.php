<?php

namespace HuberwayCMS\Menu\Database\Traits;

use HuberwayCMS\Language\Models\LanguageMeta;
use HuberwayCMS\Menu\Facades\Menu;
use HuberwayCMS\Menu\Models\Menu as MenuModel;
use HuberwayCMS\Menu\Models\MenuLocation;
use HuberwayCMS\Menu\Models\MenuNode;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

trait HasMenuSeeder
{
    protected function createMenus(array $data, bool $truncate = true): void
    {
        if ($truncate) {
            MenuModel::query()->truncate();
            MenuLocation::query()->truncate();
            MenuNode::query()->truncate();
        }

        foreach ($data as $index => $item) {
            $item['slug'] = Str::slug($item['name']);

            /**
             * @var MenuModel $menu
             */
            $menu = MenuModel::query()->create(Arr::except($item, ['items', 'location']));

            if (isset($item['location'])) {
                /**
                 * @var MenuLocation $menuLocation
                 */
                $menuLocation = MenuLocation::query()->create([
                    'menu_id' => $menu->getKey(),
                    'location' => $item['location'],
                ]);

                if (is_plugin_active('language')) {
                    LanguageMeta::saveMetaData($menuLocation);
                }
            }

            foreach ($item['items'] as $menuNode) {
                $this->createMenuNode($index, $menuNode, $menu->getKey());
            }

            if (is_plugin_active('language')) {
                LanguageMeta::saveMetaData($menu);
            }
        }

        Menu::clearCacheMenuItems();
    }

    protected function createMenuNode(int $index, array $menuNode, int|string $menuId, int|string $parentId = 0): void
    {
        $menuNode['menu_id'] = $menuId;
        $menuNode['parent_id'] = $parentId;

        if (isset($menuNode['url'])) {
            $menuNode['url'] = str_replace(url(''), '', $menuNode['url']);
        }

        if (Arr::has($menuNode, 'children') && ! empty($menuNode['children'])) {
            $children = $menuNode['children'];
            $menuNode['has_child'] = true;
        } else {
            $children = [];
            $menuNode['has_child'] = false;
        }

        Arr::forget($menuNode, 'children');

        $createdNode = MenuNode::query()->create($menuNode);

        if ($children) {
            foreach ($children as $child) {
                $this->createMenuNode($index, $child, $menuId, $createdNode->getKey());
            }
        }
    }
}
