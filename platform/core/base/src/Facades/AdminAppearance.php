<?php

namespace HuberwayCMS\Base\Facades;

use HuberwayCMS\Base\Supports\AdminAppearance as BaseAdminAppearance;
use Illuminate\Support\Facades\Facade;

/**
 * @method static static forUser(\Illuminate\Contracts\Auth\Authenticatable|\HuberwayCMS\ACL\Contracts\HasPreferences $user)
 * @method static static forCurrentUser(string|null $guard = null)
 * @method static string getLocale()
 * @method static string getLocaleDirection()
 * @method static string getCurrentLayout()
 * @method static bool isVerticalLayout()
 * @method static bool isHorizontalLayout()
 * @method static bool showMenuItemIcon()
 * @method static array getLayouts()
 * @method static string getContainerWidth()
 * @method static array getContainerWidths()
 * @method static mixed getSetting(string $key, mixed|null $default = null)
 * @method static mixed getUserSetting(string $key, mixed|null $default = null)
 * @method static string getSettingKey(string $key)
 * @method static void setSetting(array|string $key, mixed|null $value = null)
 *
 * @see \HuberwayCMS\Base\Supports\AdminAppearance
 */
class AdminAppearance extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseAdminAppearance::class;
    }
}
