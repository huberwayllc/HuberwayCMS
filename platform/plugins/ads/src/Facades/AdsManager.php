<?php

namespace HuberwayCMS\Ads\Facades;

use HuberwayCMS\Ads\Supports\AdsManager as AdsManagerSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static string display(string $location, array $attributes = [])
 * @method static \HuberwayCMS\Ads\Supports\AdsManager load(bool $force = false, array $with = [])
 * @method static bool locationHasAds(string $location)
 * @method static string|null displayAds(string|null $key, array $attributes = [])
 * @method static \Illuminate\Support\Collection getData(bool $isLoad = false, bool $isNotExpired = false)
 * @method static \HuberwayCMS\Ads\Supports\AdsManager registerLocation(string $key, string $name)
 * @method static array getLocations()
 * @method static \HuberwayCMS\Ads\Models\Ads|null getAds(string $key)
 *
 * @see \HuberwayCMS\Ads\Supports\AdsManager
 */
class AdsManager extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return AdsManagerSupport::class;
    }
}
