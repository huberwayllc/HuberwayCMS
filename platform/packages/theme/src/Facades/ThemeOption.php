<?php

namespace HuberwayCMS\Theme\Facades;

use HuberwayCMS\Theme\ThemeOption as BaseThemeOption;
use Illuminate\Support\Facades\Facade;

/**
 * @method static array constructArgs()
 * @method static array constructSections()
 * @method static array constructFields(string $sectionId = '')
 * @method static bool getSection(string $id = '')
 * @method static void checkOptName()
 * @method static array getSections()
 * @method static \HuberwayCMS\Theme\ThemeOption setSections(array $sections = [])
 * @method static \HuberwayCMS\Theme\ThemeOption setSection(array $section = [])
 * @method static int getPriority(string $type)
 * @method static void processFieldsArray(string $sectionId = '', array $fields = [])
 * @method static \HuberwayCMS\Theme\ThemeOption setField(array $field = [])
 * @method static \HuberwayCMS\Theme\ThemeOption removeSection(string $id = '', bool $fields = false)
 * @method static void hideSection(string $id = '', bool $hide = true)
 * @method static array|bool getField(string $id = '')
 * @method static void hideField(string $id = '', bool $hide = true)
 * @method static \HuberwayCMS\Theme\ThemeOption removeField(string $id = '')
 * @method static array getArgs()
 * @method static \HuberwayCMS\Theme\ThemeOption setArgs(array $args = [])
 * @method static string|null getArg(string $key = '')
 * @method static \HuberwayCMS\Theme\ThemeOption setOption(string $key, array|string|null $value = '')
 * @method static string getOptionKey(string $key, string|null $locale = '', string|null $theme = null)
 * @method static string|null renderField(array $field)
 * @method static bool hasOption(string $key)
 * @method static string|null getOption(string $key = '', array|string|null $default = '')
 * @method static bool saveOptions()
 * @method static array getFields()
 * @method static bool hasField(string $id)
 * @method static array prepareFromArray(array $options, string|null $locale = null, string|null $defaultLocale = null)
 * @method static \HuberwayCMS\Theme\ThemeOption|mixed when(\Closure|mixed|null $value = null, callable|null $callback = null, callable|null $default = null)
 * @method static \HuberwayCMS\Theme\ThemeOption|mixed unless(\Closure|mixed|null $value = null, callable|null $callback = null, callable|null $default = null)
 * @method static \HuberwayCMS\Theme\ThemeOption|\Illuminate\Support\HigherOrderTapProxy tap(callable|null $callback = null)
 *
 * @see \HuberwayCMS\Theme\ThemeOption
 */
class ThemeOption extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseThemeOption::class;
    }
}
