<?php

namespace HuberwayCMS\Ecommerce\Forms\Settings;

use HuberwayCMS\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\OnOffFieldOption;
use HuberwayCMS\Base\Forms\Fields\MultiCheckListField;
use HuberwayCMS\Base\Forms\Fields\OnOffCheckboxField;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\ProductSearchSettingRequest;
use HuberwayCMS\Setting\Forms\SettingForm;

class ProductSearchSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.product_search.product_search_settings'))
            ->setSectionDescription(
                trans('plugins/ecommerce::setting.product_search.product_search_settings_description')
            )
            ->setValidatorClass(ProductSearchSettingRequest::class)
            ->add('search_for_an_exact_phrase', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.product_search.form.search_for_an_exact_phrase'),
                'value' => get_ecommerce_setting('search_for_an_exact_phrase', false),
            ])
            ->add(
                'search_products_by[]',
                MultiCheckListField::class,
                MultiChecklistFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.product_search.form.search_products_by'))
                    ->choices([
                        'name' => trans('plugins/ecommerce::products.form.name'),
                        'sku' => trans('plugins/ecommerce::products.sku'),
                        'variation_sku' => trans('plugins/ecommerce::products.variation_sku'),
                        'description' => trans('plugins/ecommerce::products.form.description'),
                        'brand' => trans('plugins/ecommerce::products.form.brand'),
                        'tag' => trans('plugins/ecommerce::products.form.tags'),
                    ])
                    ->selected(old('product_collections', EcommerceHelper::getProductsSearchBy()))
                    ->toArray()
            )
            ->add(
                'enable_filter_products_by_brands',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.product_search.form.enable_filter_products_by_brands'))
                    ->value(EcommerceHelper::isEnabledFilterProductsByBrands())
                    ->defaultValue(true)
                    ->toArray()
            )
            ->add(
                'enable_filter_products_by_tags',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.product_search.form.enable_filter_products_by_tags'))
                    ->value(EcommerceHelper::isEnabledFilterProductsByTags())
                    ->defaultValue(true)
                    ->toArray()
            )
            ->add(
                'enable_filter_products_by_attributes',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(
                        trans('plugins/ecommerce::setting.product_search.form.enable_filter_products_by_attributes')
                    )
                    ->value(EcommerceHelper::isEnabledFilterProductsByAttributes())
                    ->defaultValue(true)
                    ->toArray()
            );
    }
}
