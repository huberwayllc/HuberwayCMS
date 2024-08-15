<?php

namespace HuberwayCMS\Ecommerce\Facades;

use HuberwayCMS\Ecommerce\Supports\CurrencySupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static void setApplicationCurrency(\HuberwayCMS\Ecommerce\Models\Currency $currency)
 * @method static \HuberwayCMS\Ecommerce\Models\Currency|null getApplicationCurrency()
 * @method static \HuberwayCMS\Ecommerce\Models\Currency|null getDefaultCurrency()
 * @method static \Illuminate\Support\Collection currencies()
 * @method static string|null detectedCurrencyCode()
 * @method static array countryCurrencies()
 * @method static array currencyCodes()
 *
 * @see \HuberwayCMS\Ecommerce\Supports\CurrencySupport
 */
class Currency extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return CurrencySupport::class;
    }
}
