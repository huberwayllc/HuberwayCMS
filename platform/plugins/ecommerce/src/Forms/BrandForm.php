<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\OnOffFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\Fields\OnOffField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\Fields\TreeCategoryField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Facades\ProductCategoryHelper;
use HuberwayCMS\Ecommerce\Http\Requests\BrandRequest;
use HuberwayCMS\Ecommerce\Models\Brand;

class BrandForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new Brand())
            ->setValidatorClass(BrandRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->toArray())
            ->add('description', 'editor', [
                'label' => trans('core/base::forms.description'),
                'attr' => [
                    'rows' => 4,
                    'placeholder' => trans('plugins/ecommerce::products.form.description'),
                    'data-counter' => 400,
                ],
            ])
            ->add('website', 'text', [
                'label' => trans('plugins/ecommerce::brands.form.website'),
                'attr' => [
                    'placeholder' => 'Ex: https://example.com',
                    'data-counter' => 120,
                ],
            ])
            ->add('order', 'number', [
                'label' => trans('core/base::forms.order'),
                'attr' => [
                    'placeholder' => trans('core/base::forms.order_by_placeholder'),
                ],
                'default_value' => 0,
            ])
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->add('logo', 'mediaImage', [
                'label' => trans('plugins/ecommerce::brands.logo'),
            ])
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
                    ->toArray()
            )
            ->add(
                'categories[]',
                TreeCategoryField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::products.form.categories'))
                    ->choices(ProductCategoryHelper::getActiveTreeCategories())
                    ->selected($this->getModel()->id ? $this->getModel()->categories->pluck('id')->all() : [])
                    ->addAttribute('card-body-class', 'p-0')
                    ->toArray()
            )
            ->setBreakFieldPoint('status');
    }
}
