<?php

namespace HuberwayCMS\Payment\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\EditorFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\TextFieldOption;
use HuberwayCMS\Base\Forms\Fields\EditorField;
use HuberwayCMS\Base\Forms\Fields\HtmlField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Payment\Enums\PaymentMethodEnum;

class CODPaymentMethodForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->template('plugins/payment::forms.fields-only')
            ->add(
                'type',
                'hidden',
                TextFieldOption::make()
                    ->value(PaymentMethodEnum::COD)
                    ->attributes(['class' => 'payment_type'])
                    ->toArray()
            )
            ->add(
                sprintf('payment_%s_name', PaymentMethodEnum::COD),
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/payment::payment.method_name'))
                    ->attributes(['data-counter' => 400])
                    ->value(get_payment_setting(
                        'name',
                        PaymentMethodEnum::COD,
                        PaymentMethodEnum::COD()->label(),
                    ))
                    ->toArray(),
            )
            ->add(
                sprintf('payment_%s_description', PaymentMethodEnum::COD),
                EditorField::class,
                EditorFieldOption::make()
                    ->wrapperAttributes(['style' => 'max-width: 99.8%'])
                    ->label(trans('plugins/payment::payment.payment_method_description'))
                    ->value(get_payment_setting('description', PaymentMethodEnum::COD))
                    ->toArray()
            )
            ->when(
                apply_filters(PAYMENT_METHOD_SETTINGS_CONTENT, null, PaymentMethodEnum::COD),
                function (FormAbstract $form, string|null $data) {
                    $form->add('metabox', HtmlField::class, ['html' => $data]);
                }
            );
    }
}
