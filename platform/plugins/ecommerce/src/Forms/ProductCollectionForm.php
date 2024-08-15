<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Base\Forms\FieldOptions\DescriptionFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\OnOffFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\Fields\OnOffField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextareaField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Http\Requests\ProductCollectionRequest;
use HuberwayCMS\Ecommerce\Models\ProductCollection;

class ProductCollectionForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addStylesDirectly('vendor/core/plugins/ecommerce/css/ecommerce.css')
            ->addScriptsDirectly('vendor/core/plugins/ecommerce/js/edit-product-collection.js');

        $this
            ->setupModel(new ProductCollection())
            ->setValidatorClass(ProductCollectionRequest::class)
            ->add(
                'name',
                TextField::class,
                NameFieldOption::make()
                    ->when($this->getModel()->slug, function (NameFieldOption $option, string $slug) {
                        $option
                            ->helperText(trans('plugins/ecommerce::product-collections.slug_help_block', compact('slug')));
                    })
                    ->toArray()
            )
            ->add('slug', 'text', [
                'label' => trans('core/base::forms.slug'),
                'required' => true,
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
                    ->toArray()
            )
            ->add('image', 'mediaImage')
            ->setBreakFieldPoint('status');

        if ($productCollectionId = $this->getModel()->id) {
            $this
                ->addMetaBoxes([
                    'collection-products' => [
                        'title' => trans('plugins/ecommerce::products.name'),
                        'content' =>
                            Html::tag('div', '', [
                                'class' => 'wrap-collection-products',
                                'data-target' => route('product-collections.get-product-collection', $productCollectionId),
                            ]),
                        'priority' => 9999,
                    ],
            ]);
        }
    }
}
