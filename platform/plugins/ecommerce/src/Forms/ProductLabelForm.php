<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Http\Requests\ProductLabelRequest;
use HuberwayCMS\Ecommerce\Models\ProductLabel;

class ProductLabelForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new ProductLabel())
            ->setValidatorClass(ProductLabelRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->toArray())
            ->add('color', 'customColor', [
                'label' => trans('plugins/ecommerce::product-label.color'),
                'attr' => [
                    'placeholder' => trans('plugins/ecommerce::product-label.color_placeholder'),
                ],
            ])
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->setBreakFieldPoint('status');
    }
}
