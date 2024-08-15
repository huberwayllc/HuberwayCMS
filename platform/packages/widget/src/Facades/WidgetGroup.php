<?php

namespace HuberwayCMS\Widget\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @method static \HuberwayCMS\Widget\WidgetGroup group(string $sidebarId)
 * @method static \HuberwayCMS\Widget\WidgetGroupCollection setGroup(array $args)
 * @method static \HuberwayCMS\Widget\WidgetGroupCollection removeGroup(string $groupId)
 * @method static array getGroups()
 * @method static string render(string $sidebarId)
 * @method static void load(bool $force = false)
 * @method static \Illuminate\Support\Collection getData()
 *
 * @see \HuberwayCMS\Widget\WidgetGroupCollection
 */
class WidgetGroup extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'huberwaycms.widget-group-collection';
    }
}
