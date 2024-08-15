<?php

use HuberwayCMS\Menu\Repositories\Interfaces\MenuInterface;
use HuberwayCMS\Widget\AbstractWidget;

class CustomMenuWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Custom Menu'),
            'description' => __('Add a custom menu to your widget area.'),
            'menu_id' => null,
        ]);
    }

    protected function adminConfig(): array
    {
        return [
            'menus' => app(MenuInterface::class)->pluck('name', 'slug'),
        ];
    }
}
