<?php

namespace HuberwayCMS\Ecommerce\Forms\Settings;

use HuberwayCMS\Base\Forms\FieldOptions\OnOffFieldOption;
use HuberwayCMS\Base\Forms\Fields\OnOffCheckboxField;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\ProductReviewSettingRequest;
use HuberwayCMS\Setting\Forms\SettingForm;

class ProductReviewSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.product_review.name'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.product_review.description'))
            ->setValidatorClass(ProductReviewSettingRequest::class)
            ->add('review_enabled', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.product_review.form.enable_review'),
                'value' => EcommerceHelper::isReviewEnabled(),
                'wrapper' => [
                    'class' => 'mb-0',
                ],
                'attr' => [
                    'data-bb-toggle' => 'collapse',
                    'data-bb-target' => '.review-settings',
                ],
            ])
            ->add('open_fieldset_review_settings', 'html', [
                'html' => sprintf(
                    '<fieldset class="form-fieldset mt-3 review-settings" style="display: %s;" data-bb-value="1">',
                    EcommerceHelper::isReviewEnabled() ? 'block' : 'none'
                ),
            ])
            ->add('review_max_file_size', 'number', [
                'label' => trans('plugins/ecommerce::setting.product_review.form.review.max_file_size'),
                'value' => EcommerceHelper::reviewMaxFileSize(),
                'attr' => [
                    'min' => 1,
                    'max' => 1024,
                ],
            ])
            ->add('review_max_file_number', 'number', [
                'label' => trans('plugins/ecommerce::setting.product_review.form.review.max_file_number'),
                'value' => EcommerceHelper::reviewMaxFileNumber(),
                'attr' => [
                    'min' => 1,
                    'max' => 100,
                ],
            ])
            ->add('only_allow_customers_purchased_to_review', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.product_review.form.only_allow_customers_purchased_to_review'),
                'value' => EcommerceHelper::onlyAllowCustomersPurchasedToReview(),
            ])
            ->add(
                'review_need_to_be_approved',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.product_review.form.review_need_to_be_approved'))
                    ->value(get_ecommerce_setting('review_need_to_be_approved'))
                    ->toArray(),
            )
            ->add('close_fieldset_review_settings', 'html', ['html' => '</fieldset>']);
    }
}
