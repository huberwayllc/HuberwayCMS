<?php

namespace HuberwayCMS\Base\Facades;

use HuberwayCMS\Base\Supports\Assets as BaseAssets;
use Illuminate\Support\Facades\Facade;

/**
 * @method static void setConfig(array $config)
 * @method static string renderHeader($lastStyles = [])
 * @method static string renderFooter()
 * @method static \HuberwayCMS\Base\Supports\Assets usingVueJS()
 * @method static \HuberwayCMS\Base\Supports\Assets disableVueJS()
 * @method static bool hasVueJs()
 * @method static \HuberwayCMS\Assets\Assets addScripts(string|array $assets)
 * @method static \HuberwayCMS\Assets\Assets addStyles(string|array $assets)
 * @method static \HuberwayCMS\Assets\Assets addStylesDirectly(array|string $assets)
 * @method static \HuberwayCMS\Assets\Assets addScriptsDirectly(string|array $assets, string $location = 'footer')
 * @method static \HuberwayCMS\Assets\Assets removeStyles(string|array $assets)
 * @method static \HuberwayCMS\Assets\Assets removeScripts(string|array $assets)
 * @method static \HuberwayCMS\Assets\Assets removeItemDirectly(string|array $assets, string|null $location = null)
 * @method static array getScripts(string|null $location = null)
 * @method static array getStyles(array $lastStyles = [])
 * @method static string|null scriptToHtml(string $name)
 * @method static string|null styleToHtml(string $name)
 * @method static string getBuildVersion()
 * @method static \HuberwayCMS\Assets\HtmlBuilder getHtmlBuilder()
 *
 * @see \HuberwayCMS\Base\Supports\Assets
 */
class Assets extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseAssets::class;
    }
}
