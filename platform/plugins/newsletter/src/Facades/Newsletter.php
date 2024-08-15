<?php

namespace HuberwayCMS\Newsletter\Facades;

use HuberwayCMS\Newsletter\Contracts\Factory;
use Illuminate\Support\Facades\Facade;

/**
 * @method static string getDefaultDriver()
 * @method static mixed driver(string|null $driver = null)
 * @method static \HuberwayCMS\Newsletter\NewsletterManager extend(string $driver, \Closure $callback)
 * @method static array getDrivers()
 * @method static \Illuminate\Contracts\Container\Container getContainer()
 * @method static \HuberwayCMS\Newsletter\NewsletterManager setContainer(\Illuminate\Contracts\Container\Container $container)
 * @method static \HuberwayCMS\Newsletter\NewsletterManager forgetDrivers()
 *
 * @see \HuberwayCMS\Newsletter\NewsletterManager
 */
class Newsletter extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return Factory::class;
    }
}
