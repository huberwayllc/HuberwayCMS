<?php

namespace HuberwayCMS\Base\Facades;

use HuberwayCMS\Base\Supports\PageTitle as PageTitleSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static void setSiteName(string $siteName)
 * @method static void setSeparator(string $separator)
 * @method static void setTitle(string $title)
 * @method static string|null getTitle(bool $withSiteName = true)
 *
 * @see \HuberwayCMS\Base\Supports\PageTitle
 */
class PageTitle extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return PageTitleSupport::class;
    }
}
