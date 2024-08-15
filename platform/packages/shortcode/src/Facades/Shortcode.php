<?php

namespace HuberwayCMS\Shortcode\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @method static \HuberwayCMS\Shortcode\Shortcode register(string $key, string|null $name, string|null $description = null, $callback = null, string $previewImage = '')
 * @method static \HuberwayCMS\Shortcode\Shortcode setPreviewImage(string $key, string $previewImage)
 * @method static \HuberwayCMS\Shortcode\Shortcode enable()
 * @method static \HuberwayCMS\Shortcode\Shortcode disable()
 * @method static \Illuminate\Support\HtmlString compile(string $value, bool $force = false)
 * @method static string|null strip(string|null $value)
 * @method static array getAll()
 * @method static void setAdminConfig(string $key, callable|array|string|null $html)
 * @method static void modifyAdminConfig(string $key, callable $callback)
 * @method static string generateShortcode(string $name, array $attributes = [])
 * @method static \HuberwayCMS\Shortcode\Compilers\ShortcodeCompiler getCompiler()
 * @method static \HuberwayCMS\Shortcode\ShortcodeField fields()
 *
 * @see \HuberwayCMS\Shortcode\Shortcode
 */
class Shortcode extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'shortcode';
    }
}
