<?php

namespace HuberwayCMS\SimpleSlider\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\DescriptionFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\MediaImageFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\SortOrderFieldOption;
use HuberwayCMS\Base\Forms\Fields\MediaImageField;
use HuberwayCMS\Base\Forms\Fields\NumberField;
use HuberwayCMS\Base\Forms\Fields\TextareaField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\SimpleSlider\Http\Requests\SimpleSliderItemRequest;
use HuberwayCMS\SimpleSlider\Models\SimpleSliderItem;

class SimpleSliderItemForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(SimpleSliderItem::class)
            ->setValidatorClass(SimpleSliderItemRequest::class)
            ->contentOnly()
            ->add('simple_slider_id', 'hidden', [
                'value' => $this->getRequest()->input('simple_slider_id'),
            ])
            ->add('title', TextField::class, [
                'label' => trans('core/base::forms.title'),
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('link', TextField::class, [
                'label' => trans('core/base::forms.link'),
                'attr' => [
                    'placeholder' => 'https://',
                    'data-counter' => 120,
                ],
            ])
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->add('order', NumberField::class, SortOrderFieldOption::make()->toArray())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make()->required()->toArray());
    }
}
