<?php

use HuberwayCMS\Menu\Models\Menu;
use HuberwayCMS\Menu\Models\MenuNode;
use HuberwayCMS\Page\Models\Page;

return [
    'supported' => [
        Page::class,
        Menu::class,
        MenuNode::class,
    ],
];
