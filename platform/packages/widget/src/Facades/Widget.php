<?php

namespace HuberwayCMS\Widget\Facades;

use HuberwayCMS\Widget\WidgetGroup;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \HuberwayCMS\Widget\Factories\WidgetFactory registerWidget(string $widget)
 * @method static array getWidgets()
 * @method static \Illuminate\Support\HtmlString|string|null run()
 *
 * @see \HuberwayCMS\Widget\Factories\WidgetFactory
 */
class Widget extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'huberwaycms.widget';
    }

    public static function group(string $name): WidgetGroup
    {
        return app('huberwaycms.widget-group-collection')->group($name);
    }
}
