<?php

namespace HuberwayCMS\Payment\Forms\Settings;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Payment\Enums\PaymentMethodEnum;
use HuberwayCMS\Payment\Http\Requests\Settings\PaymentMethodSettingRequest;
use HuberwayCMS\Payment\Supports\PaymentHelper;
use HuberwayCMS\Setting\Forms\SettingForm;

class PaymentMethodSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        Assets::addStylesDirectly('vendor/core/plugins/payment/css/payment-setting.css');

        $this
            ->contentOnly()
            ->setSectionTitle(trans('plugins/payment::payment.payment_methods'))
            ->setSectionDescription(trans('plugins/payment::payment.payment_methods_description'))
            ->setValidatorClass(PaymentMethodSettingRequest::class)
            ->setUrl(route('payments.settings'))
            ->add(
                'default_payment_method',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/payment::payment.default_payment_method'))
                    ->choices(PaymentMethodEnum::labels())
                    ->selected(PaymentHelper::defaultPaymentMethod())
                    ->toArray(),
            );
    }
}
