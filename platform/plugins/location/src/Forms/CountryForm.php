<?php

namespace HuberwayCMS\Location\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\IsDefaultFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\SortOrderFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\Fields\NumberField;
use HuberwayCMS\Base\Forms\Fields\OnOffField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Location\Http\Requests\CountryRequest;
use HuberwayCMS\Location\Models\Country;

class CountryForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Country::class)
            ->setValidatorClass(CountryRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required()->toArray())
            ->add('code', TextField::class, [
                'label' => trans('plugins/location::country.code'),
                'attr' => [
                    'placeholder' => trans('plugins/location::country.code_placeholder'),
                    'data-counter' => 10,
                ],
                'help_block' => [
                    'text' => trans('plugins/location::country.code_helper'),
                ],
            ])
            ->add('nationality', TextField::class, [
                'label' => trans('plugins/location::country.nationality'),
                'attr' => [
                    'placeholder' => trans('plugins/location::country.nationality'),
                    'data-counter' => 120,
                ],
            ])
            ->add('order', NumberField::class, SortOrderFieldOption::make()->toArray())
            ->add('is_default', OnOffField::class, IsDefaultFieldOption::make()->toArray())
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->setBreakFieldPoint('status');
    }
}
