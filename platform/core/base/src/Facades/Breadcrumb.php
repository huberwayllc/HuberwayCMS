<?php

namespace HuberwayCMS\Base\Facades;

use HuberwayCMS\Base\Supports\Breadcrumb as BreadcrumbSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static static for(string $group)
 * @method static static default()
 * @method static static add(string $label, string $url = '')
 * @method static static prepend(string $label, string $url = '')
 * @method static \Illuminate\Support\Collection getItems()
 * @method static string render()
 * @method static string toHtml()
 * @method static static renderUsing(\Closure $renderUsingCallback)
 * @method static static beforeRendering(\Closure $beforeRenderCallback)
 * @method static static afterRendering(\Closure $afterRenderCallback)
 * @method static mixed|null rendering(\Closure|string $content)
 *
 * @see \HuberwayCMS\Base\Supports\Breadcrumb
 */
class Breadcrumb extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BreadcrumbSupport::class;
    }
}
