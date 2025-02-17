<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Captcha\Facades\Captcha;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class RegisterRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'name' => 'required|max:120|min:2',
            'email' => [
                'nullable',
                Rule::requiredIf(! EcommerceHelper::isLoginUsingPhone()),
                'max:120',
                'min:6',
                'email',
                Rule::unique('ec_customers'),
            ],
            'phone' => [
                'nullable',
                Rule::requiredIf(EcommerceHelper::isLoginUsingPhone()),
                ...explode('|', BaseHelper::getPhoneValidationRule()),
                'unique:ec_customers',
            ],
            'password' => 'required|min:6|confirmed',
            'agree_terms_and_policy' => 'sometimes|accepted:1',
        ];

        if (is_plugin_active('captcha')) {
            if (get_ecommerce_setting('enable_recaptcha_in_register_page', 0)) {
                $rules += Captcha::rules();
            }

            if (Captcha::mathCaptchaEnabled() && get_ecommerce_setting('enable_math_captcha_in_register_page', 0)) {
                $rules += Captcha::mathCaptchaRules();
            }
        }

        return apply_filters('ecommerce_customer_registration_form_validation_rules', $rules);
    }

    public function attributes(): array
    {
        return apply_filters('ecommerce_customer_registration_form_validation_attributes', [
            'name' => __('Name'),
            'email' => __('Email'),
            'password' => __('Password'),
            'agree_terms_and_policy' => __('Term and Policy'),
        ] + (is_plugin_active('captcha') ? Captcha::attributes() : []));
    }

    public function messages(): array
    {
        return apply_filters('ecommerce_customer_registration_form_validation_messages', []);
    }
}
