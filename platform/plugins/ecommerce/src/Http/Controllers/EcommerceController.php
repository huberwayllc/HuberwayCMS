<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Services\ExchangeRates\ExchangeRateInterface;
use Illuminate\Support\Facades\Cache;
use Throwable;

class EcommerceController extends BaseController
{
    public function ajaxGetCountries()
    {
        return $this
            ->httpResponse()
            ->setData(EcommerceHelper::getAvailableCountries());
    }

    public function updateCurrenciesFromExchangeApi(ExchangeRateInterface $exchangeRateService)
    {
        try {
            $currencyUpdated = $exchangeRateService->getCurrentExchangeRate();

            return $this
                ->httpResponse()
                ->setData($currencyUpdated)
                ->withUpdatedSuccessMessage();
        } catch (Throwable $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function clearCacheCurrencyRates(ExchangeRateInterface $exchangeRateService)
    {
        Cache::forget('currency_exchange_rate');

        $exchangeRateService->cacheExchangeRates();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::currency.clear_cache_rates_successfully'));
    }
}
