<?php

namespace HuberwayCMS\Base\GlobalSearch\Providers;

use HuberwayCMS\Base\Facades\DashboardMenu;
use HuberwayCMS\Base\GlobalSearch\GlobalSearchableProvider;
use HuberwayCMS\Base\GlobalSearch\GlobalSearchableResult;
use Illuminate\Support\Collection;

class DashboardMenuProvider extends GlobalSearchableProvider
{
    public function search(string $keyword): Collection
    {
        return $this->searchRecursive($keyword, DashboardMenu::getAll());
    }

    protected function searchRecursive(string $keyword, Collection $menu, string $prefix = ''): Collection
    {
        $items = collect();

        foreach ($menu as $item) {
            $name = trans($item['name']);

            if (! empty($item['children'])) {
                $children = $this->searchRecursive($keyword, $item['children'], $name);

                if ($children->isNotEmpty()) {
                    $items = $items->merge($children);

                    continue;
                }
            }

            if ($this->stringContains($name, $keyword) && ! empty($item['url'])) {
                $items->push(
                    new GlobalSearchableResult(
                        title: $name,
                        parents: $prefix !== '' ? [$prefix] : [],
                        url: $item['url'],
                    )
                );
            }
        }

        return $items;
    }
}
