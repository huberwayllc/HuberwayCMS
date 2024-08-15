<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\ContentFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\OnOffFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\Fields\EditorField;
use HuberwayCMS\Base\Forms\Fields\OnOffField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Http\Requests\ProductCategoryRequest;
use HuberwayCMS\Ecommerce\Models\ProductCategory;

class ProductCategoryForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new ProductCategory())
            ->setValidatorClass(ProductCategoryRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->toArray())
            ->add(
                'description',
                EditorField::class,
                ContentFieldOption::make()->label(trans('core/base::forms.description'))->toArray()
            )
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->add('image', 'mediaImage')
            ->add(
                'icon',
                $this->getFormHelper()->hasCustomField('themeIcon') ? 'themeIcon' : 'text',
                [
                    'label' => __('Font Icon'),
                    'attr' => [
                        'placeholder' => 'ex: fa fa-home',
                    ],
                    'empty_value' => __('-- None --'),
                ]
            )
            ->add('icon_image', 'mediaImage', [
                'label' => __('Icon image'),
                'help_block' => [
                    'text' => __('It will replace Icon Font if it is present.'),
                ],
                'wrapper' => [
                    'style' => 'display: block;',
                ],
            ])
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
                    ->toArray()
            )
            ->setBreakFieldPoint('status');
    }
}
