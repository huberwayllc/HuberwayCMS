<?php

namespace HuberwayCMS\SeoHelper\Facades;

use HuberwayCMS\SeoHelper\SeoHelper as BaseSeoHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \HuberwayCMS\SeoHelper\SeoHelper setSeoMeta(\HuberwayCMS\SeoHelper\Contracts\SeoMetaContract $seoMeta)
 * @method static \HuberwayCMS\SeoHelper\SeoHelper setSeoOpenGraph(\HuberwayCMS\SeoHelper\Contracts\SeoOpenGraphContract $seoOpenGraph)
 * @method static \HuberwayCMS\SeoHelper\SeoHelper setSeoTwitter(\HuberwayCMS\SeoHelper\Contracts\SeoTwitterContract $seoTwitter)
 * @method static \HuberwayCMS\SeoHelper\Contracts\SeoOpenGraphContract openGraph()
 * @method static \HuberwayCMS\SeoHelper\SeoHelper setTitle(string|null $title, string|null $siteName = null, string|null $separator = null)
 * @method static \HuberwayCMS\SeoHelper\Contracts\SeoMetaContract meta()
 * @method static \HuberwayCMS\SeoHelper\Contracts\SeoTwitterContract twitter()
 * @method static string|null getTitle()
 * @method static string|null getDescription()
 * @method static \HuberwayCMS\SeoHelper\SeoHelper setDescription($description)
 * @method static mixed render()
 * @method static bool saveMetaData(string $screen, \Illuminate\Http\Request $request, \Illuminate\Database\Eloquent\Model $object)
 * @method static bool deleteMetaData(string $screen, \Illuminate\Database\Eloquent\Model $object)
 * @method static \HuberwayCMS\SeoHelper\SeoHelper registerModule(array|string $model)
 *
 * @see \HuberwayCMS\SeoHelper\SeoHelper
 */
class SeoHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseSeoHelper::class;
    }
}
