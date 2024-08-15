<?php

use HuberwayCMS\Menu\Facades\Menu;

app()->booted(fn () => Menu::useMenuItemIconImage());
