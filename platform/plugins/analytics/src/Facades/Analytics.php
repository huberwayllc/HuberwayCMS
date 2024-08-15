<?php

namespace HuberwayCMS\Analytics\Facades;

use HuberwayCMS\Analytics\Abstracts\AnalyticsAbstract;
use Illuminate\Support\Facades\Facade;

/**
 * @method static string getCredentials()
 * @method static \Google\Analytics\Data\V1beta\BetaAnalyticsDataClient getClient()
 * @method static \HuberwayCMS\Analytics\AnalyticsResponse get()
 * @method static \Illuminate\Support\Collection fetchMostVisitedPages(\HuberwayCMS\Analytics\Period $period, int $maxResults = 20)
 * @method static \Illuminate\Support\Collection fetchTopReferrers(\HuberwayCMS\Analytics\Period $period, int $maxResults = 20)
 * @method static \Illuminate\Support\Collection fetchTopBrowsers(\HuberwayCMS\Analytics\Period $period, int $maxResults = 10)
 * @method static \Illuminate\Support\Collection performQuery(\HuberwayCMS\Analytics\Period $period, array|string $metrics, array|string $dimensions = [])
 * @method static string getPropertyId()
 * @method static void macro(string $name, object|callable $macro)
 * @method static void mixin(object $mixin, bool $replace = true)
 * @method static bool hasMacro(string $name)
 * @method static void flushMacros()
 * @method static \HuberwayCMS\Analytics\Analytics dateRange(\HuberwayCMS\Analytics\Period $period)
 * @method static \HuberwayCMS\Analytics\Analytics dateRanges(\HuberwayCMS\Analytics\Period ...$items)
 * @method static \HuberwayCMS\Analytics\Analytics metric(string $name)
 * @method static \HuberwayCMS\Analytics\Analytics metrics(array|string $items)
 * @method static \HuberwayCMS\Analytics\Analytics dimension(string $name)
 * @method static \HuberwayCMS\Analytics\Analytics dimensions(array|string $items)
 * @method static \HuberwayCMS\Analytics\Analytics orderByMetric(string $name, string $order = 'ASC')
 * @method static \HuberwayCMS\Analytics\Analytics orderByMetricDesc(string $name)
 * @method static \HuberwayCMS\Analytics\Analytics orderByDimension(string $name, string $order = 'ASC')
 * @method static \HuberwayCMS\Analytics\Analytics orderByDimensionDesc(string $name)
 * @method static \HuberwayCMS\Analytics\Analytics metricAggregation(int $value)
 * @method static \HuberwayCMS\Analytics\Analytics metricAggregations(int ...$items)
 * @method static \HuberwayCMS\Analytics\Analytics whereDimension(string $name, int $matchType, $value, bool $caseSensitive = false)
 * @method static \HuberwayCMS\Analytics\Analytics whereDimensionIn(string $name, array $values, bool $caseSensitive = false)
 * @method static \HuberwayCMS\Analytics\Analytics whereMetric(string $name, int $operation, $value)
 * @method static \HuberwayCMS\Analytics\Analytics whereMetricBetween(string $name, $from, $to)
 * @method static \HuberwayCMS\Analytics\Analytics keepEmptyRows(bool $keepEmptyRows = false)
 * @method static \HuberwayCMS\Analytics\Analytics limit(int|null $limit = null)
 * @method static \HuberwayCMS\Analytics\Analytics offset(int|null $offset = null)
 *
 * @see \HuberwayCMS\Analytics\Analytics
 */
class Analytics extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return AnalyticsAbstract::class;
    }
}
