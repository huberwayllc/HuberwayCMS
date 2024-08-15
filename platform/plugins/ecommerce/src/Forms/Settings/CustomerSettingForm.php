<?php

namespace HuberwayCMS\Ecommerce\Forms\Settings;

use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\CustomerSettingRequest;
use HuberwayCMS\Setting\Forms\SettingForm;

class CustomerSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.customer.customer_setting'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.customer.customer_setting_description'))
            ->setValidatorClass(CustomerSettingRequest::class)
            ->add('verify_customer_email', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.customer.form.verify_customer_email'),
                'value' => EcommerceHelper::isEnableEmailVerification(),
            ])
            ->add('login_using_phone', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.customer.form.login_using_phone'),
                'value' => EcommerceHelper::isLoginUsingPhone(),
                'wrapper' => [
                    'class' => 'mb-0',
                ],
            ]);
    }
}
