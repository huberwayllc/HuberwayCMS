<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Enums\ShippingRuleTypeEnum;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Http\Requests\ShippingRuleItemRequest;
use HuberwayCMS\Ecommerce\Models\ShippingRule;
use HuberwayCMS\Ecommerce\Models\ShippingRuleItem;
use Illuminate\Database\Eloquent\Builder;

class ShippingRuleItemForm extends FormAbstract
{
    public function setup(): void
    {
        if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            Assets::addScriptsDirectly('vendor/core/plugins/location/js/location.js');
        }

        Assets::addScriptsDirectly(['vendor/core/plugins/ecommerce/js/shipping.js'])
            ->addScripts(['input-mask']);

        $rules = ShippingRule::query()
            ->whereIn('type', ShippingRuleTypeEnum::keysAllowRuleItems())
            ->whereHas('shipping', function (Builder $query) {
                $query->whereNotNull('country');
            })
            ->get();

        $optionAttrs = [
            0 => [
                'data-country' => '',
            ],
        ];

        $country = $this->getModel() ? $this->getModel()->country : '';
        $shippingRuleId = 0;
        if (request()->ajax()) {
            if (! $this->getModel() && request()->input('shipping_rule_id')) {
                $shippingRuleId = request()->input('shipping_rule_id');
            } elseif ($this->getModel()) {
                $shippingRuleId = $this->getModel()->shippingRule->id;
            }
        }

        $country = old('country', $country);

        $choices = [];
        foreach ($rules as $rule) {
            $choices[$rule->id] = $rule->name . ' - ' . format_price($rule->price) . ' / ' . $rule->shipping->country_name;
            $optionAttrs[$rule->id] = ['data-country' => $rule->shipping->country];
            if ($shippingRuleId && $shippingRuleId == $rule->id) {
                $country = $rule->shipping->country;
            }
        }

        $choices = [0 => trans('plugins/ecommerce::shipping.rule.item.forms.no_shipping_rule')] + $choices;

        $isRequiredState = false;
        if ($shippingRuleId) {
            $rule = $rules->firstWhere('id', $shippingRuleId);
            if ($rule) {
                $isRequiredState = $rule->type->getValue() == ShippingRuleTypeEnum::BASED_ON_LOCATION;
            }
        }

        $this
            ->setupModel(new ShippingRuleItem())
            ->setValidatorClass(ShippingRuleItemRequest::class)
            ->add('shipping_rule_id', 'customSelect', [
                'label' => trans('plugins/ecommerce::shipping.rule.item.forms.shipping_rule'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control shipping-rule-id',
                ],
                'optionAttrs' => $optionAttrs,
                'choices' => $choices,
                'default_value' => $shippingRuleId,
                'wrapper' => [
                    'class' => $this->formHelper->getConfig('defaults.wrapper_class') . ($shippingRuleId ? ' d-none' : ''),
                ],
            ]);

        if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            $states = ['' => trans('plugins/location::city.select_state')];
            if ($country) {
                $states += EcommerceHelper::getAvailableStatesByCountry($country);
            }

            $cities = ['' => trans('plugins/location::city.select_city')];

            $cities += EcommerceHelper::getAvailableCitiesByState(old('state', $this->getModel()->state));

            $this
                ->add('country', 'customSelect', [
                    'attr' => [
                        'data-type' => 'country',
                    ],
                    'choices' => EcommerceHelper::getAvailableCountries(),
                    'wrapper' => [
                        'class' => $this->formHelper->getConfig('defaults.wrapper_class') . ' d-none',
                    ],
                    'selected' => $country,
                ])
                ->when(count($states) > 1, function () use ($states, $isRequiredState) {
                    $this->add('state', 'customSelect', [
                        'label' => trans('plugins/ecommerce::shipping.rule.item.forms.state'),
                        'required' => $isRequiredState,
                        'attr' => [
                            'class' => 'form-control select-search-full',
                            'data-type' => 'state',
                            'data-url' => route('ajax.states-by-country'),
                        ],
                        'choices' => $states,
                    ]);
                })
                ->add('city', 'customSelect', [
                    'label' => trans('plugins/ecommerce::shipping.rule.item.forms.city'),
                    'required' => count($states) <= 1,
                    'attr' => [
                        'class' => 'form-control select-search-full',
                        'data-type' => 'city',
                        'data-url' => route('ajax.cities-by-state'),
                    ],
                    'choices' => $cities,
                ]);
        } else {
            $this
                ->add('country', 'text', [
                    'label' => trans('plugins/ecommerce::shipping.rule.item.forms.country'),
                    'attr' => [
                        'placeholder' => trans('plugins/ecommerce::shipping.rule.item.forms.country_placeholder'),
                    ],
                    'wrapper' => [
                        'class' => $this->formHelper->getConfig('defaults.wrapper_class') . ' d-none',
                    ],
                    'value' => $country,
                ])
                ->add('state', 'text', [
                    'label' => trans('plugins/ecommerce::shipping.rule.item.forms.state'),
                    'required' => $isRequiredState,
                    'attr' => [
                        'placeholder' => trans('plugins/ecommerce::shipping.rule.item.forms.state_placeholder'),
                    ],
                ])
                ->add('city', 'text', [
                    'label' => trans('plugins/ecommerce::shipping.rule.item.forms.city'),
                    'attr' => [
                        'placeholder' => trans('plugins/ecommerce::shipping.rule.item.forms.city_placeholder'),
                    ],
                ]);
        }

        $this
            ->add('zip_code', 'text', [
                'label' => trans('plugins/ecommerce::shipping.rule.item.forms.zip_code'),
                'attr' => [
                    'placeholder' => trans('plugins/ecommerce::shipping.rule.item.forms.zip_code_placeholder'),
                ],
            ])
            ->add('adjustment_price', 'text', [
                'label' => trans('plugins/ecommerce::shipping.rule.item.forms.adjustment_price'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control input-mask-number',
                    'placeholder' => trans('plugins/ecommerce::shipping.rule.item.forms.adjustment_price_placeholder'),
                    'data-placeholder' => '',
                ],
            ])
            ->add('is_enabled', 'onOff', [
                'label' => trans('plugins/ecommerce::shipping.rule.item.forms.is_enabled'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control',
                ],
                'default_value' => '1',
            ])
            ->setBreakFieldPoint('is_enabled');
    }
}
