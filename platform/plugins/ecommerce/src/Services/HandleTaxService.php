<?php

namespace HuberwayCMS\Ecommerce\Services;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Ecommerce\Facades\Cart;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Product;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

class HandleTaxService
{
    public function execute(Collection $products, array $data = []): Collection
    {
        if (! EcommerceHelper::isTaxEnabled()) {
            return $products;
        }

        if (EcommerceHelper::isUsingInMultipleCountries()) {
            $country = Arr::get($data, 'country');
        } else {
            $country = EcommerceHelper::getFirstCountryId();
        }

        $city = Arr::get($data, 'city');
        $state = Arr::get($data, 'state');

        $zipCode = null;
        if (EcommerceHelper::isZipCodeEnabled()) {
            $zipCode = Arr::get($data, 'zip_code');
        }

        if ($zipCode || ($country && $state && $city)) {
            $cartItems = Cart::instance('cart')->content();

            foreach ($products as $product) {
                $cartItem = $cartItems->where('id', $product->getKey())->first();

                $taxRate = $this->taxRate($product, $country, $state, $city, $zipCode);

                if ($taxRate != $cartItem->taxRate) {
                    Cart::instance('cart')->setTax($cartItem->rowId, $taxRate);
                }
            }
        }

        return $products;
    }

    public function taxRate(Product $product, string|null $country = null, string|null $state = null, string|null $city = null, string|null $zipCode = null): float
    {
        $taxRate = 0;
        $taxes = $product->taxes->where('status', BaseStatusEnum::PUBLISHED);
        if ($taxes->isNotEmpty()) {
            foreach ($taxes as $tax) {
                if ($tax->rules && $tax->rules->isNotEmpty()) {
                    $rule = null;
                    if ($zipCode) {
                        $rule = $tax->rules->firstWhere('zip_code', $zipCode);
                    }
                    if (! $rule && $country && $state && $city) {
                        $rule = $tax->rules
                            ->where('country', $country)
                            ->where('state', $state)
                            ->where('city', $city)
                            ->first();
                    }

                    if (! $rule && $country && $state) {
                        $rule = $tax->rules
                            ->where('country', $country)
                            ->where('state', $state)
                            ->whereNull('city')
                            ->first();
                    }
                    if (! $rule && $country) {
                        $rule = $tax->rules
                            ->where('country', $country)
                            ->whereNull('state')
                            ->whereNull('city')
                            ->first();
                    }
                    if ($rule) {
                        $taxRate += $tax->percentage;
                    }
                } else {
                    $taxRate += $tax->percentage;
                }
            }
        }

        return $taxRate;
    }
}
