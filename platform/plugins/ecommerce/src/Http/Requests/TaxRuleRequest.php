<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Tax;
use HuberwayCMS\Ecommerce\Models\TaxRule;
use HuberwayCMS\Location\Rules\CityRule;
use HuberwayCMS\Location\Rules\StateRule;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class TaxRuleRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'tax_id' => Rule::exists(Tax::class, 'id'),
            'country' => [Rule::in(array_keys(EcommerceHelper::getAvailableCountries()))],
            'state' => ['nullable'],
            'city' => ['nullable'],
        ];

        if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            $rules['state'] = ['nullable', new StateRule('country')];

            if (EcommerceHelper::useCityFieldAsTextField()) {
                $rules['city'] = [
                    'nullable',
                    'string',
                    'max:120',
                ];
            } else {
                $rules['city'] = ['nullable', new CityRule('state')];
            }
        }

        if (EcommerceHelper::isZipCodeEnabled()) {
            $rules['zip_code'] = [
                'nullable',
                'max:20',
                Rule::unique(TaxRule::class, 'zip_code')->ignore($this->route('rule')),
            ];
        }

        return $rules;
    }
}
