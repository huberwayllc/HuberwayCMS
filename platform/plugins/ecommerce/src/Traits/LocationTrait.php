<?php

namespace HuberwayCMS\Ecommerce\Traits;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Location\Models\City;
use HuberwayCMS\Location\Models\Country;
use HuberwayCMS\Location\Models\State;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @mixin \Eloquent
 */
trait LocationTrait
{
    public function getCountryNameAttribute(): string|null
    {
        $value = $this->country;

        if (! $value || ! EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            return $value;
        }

        if (is_numeric($value)) {
            $countryName = $this->locationCountry->name;

            if ($countryName) {
                return $countryName;
            }
        }

        return $value;
    }

    public function locationCountry(): BelongsTo
    {
        return $this->belongsTo(Country::class, 'country')->withDefault();
    }

    public function locationState(): BelongsTo
    {
        return $this->belongsTo(State::class, 'state')->withDefault();
    }

    public function locationCity(): BelongsTo
    {
        return $this->belongsTo(City::class, 'city')->withDefault();
    }

    public function getStateNameAttribute(): string|null
    {
        $value = $this->state;

        if (! $value || ! EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            return $value;
        }

        if (is_numeric($value)) {
            $stateName = $this->locationState->name;

            if ($stateName) {
                return $stateName;
            }
        }

        return $value;
    }

    public function getCityNameAttribute(): string|null
    {
        $value = $this->city;

        if (! $value || ! EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            return $value;
        }

        if (is_numeric($value)) {
            $cityName = $this->locationCity->name;

            if ($cityName) {
                return $cityName;
            }
        }

        return $value;
    }

    public function fullAddress(): Attribute
    {
        return Attribute::make(
            get: fn () => implode(', ', array_filter([
                $this->address,
                $this->city_name,
                $this->state_name,
                EcommerceHelper::isUsingInMultipleCountries() ? $this->country_name : '',
                EcommerceHelper::isZipCodeEnabled() ? $this->zip_code : '',
            ])),
        );
    }
}
