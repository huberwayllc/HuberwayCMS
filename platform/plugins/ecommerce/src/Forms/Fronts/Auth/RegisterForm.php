<?php

namespace HuberwayCMS\Ecommerce\Forms\Fronts\Auth;

use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Base\Forms\FieldOptions\CheckboxFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\HtmlFieldOption;
use HuberwayCMS\Base\Forms\Fields\EmailField;
use HuberwayCMS\Base\Forms\Fields\HtmlField;
use HuberwayCMS\Base\Forms\Fields\OnOffCheckboxField;
use HuberwayCMS\Base\Forms\Fields\PasswordField;
use HuberwayCMS\Base\Forms\Fields\PhoneNumberField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Captcha\Facades\Captcha;
use HuberwayCMS\Captcha\Forms\Fields\MathCaptchaField;
use HuberwayCMS\Captcha\Forms\Fields\ReCaptchaField;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Forms\Fronts\Auth\FieldOptions\EmailFieldOption;
use HuberwayCMS\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use HuberwayCMS\Ecommerce\Http\Requests\RegisterRequest;
use HuberwayCMS\Ecommerce\Models\Customer;

class RegisterForm extends AuthForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setUrl(route('customer.register.post'))
            ->setValidatorClass(RegisterRequest::class)
            ->icon('ti ti-user-plus')
            ->heading(__('Register an account'))
            ->description(__('Your personal data will be used to support your experience throughout this website, to manage access to your account.'))
            ->when(
                theme_option('register_background'),
                fn (AuthForm $form, string $background) => $form->banner($background)
            )
            ->add(
                'name',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Full name'))
                    ->placeholder(__('Your full name'))
                    ->icon('ti ti-user')
                    ->toArray()
            )
            ->add(
                'email',
                EmailField::class,
                EmailFieldOption::make()
                    ->when(EcommerceHelper::isLoginUsingPhone(), function (EmailFieldOption $fieldOption) {
                        $fieldOption->label(__('Email (optional)'));
                    }, function (EmailFieldOption $fieldOption) {
                        $fieldOption->label(__('Email'));
                    })
                    ->placeholder(__('Your email'))
                    ->icon('ti ti-mail')
                    ->toArray()
            )
            ->add(
                'phone',
                PhoneNumberField::class,
                TextFieldOption::make()
                    ->when(EcommerceHelper::isLoginUsingPhone(), function (TextFieldOption $fieldOption) {
                        $fieldOption->label(__('Phone'));
                    }, function (TextFieldOption $fieldOption) {
                        $fieldOption->label(__('Phone (optional)'));
                    })
                    ->placeholder(__('Phone number'))
                    ->icon('ti ti-phone')
                    ->toArray()
            )
            ->add(
                'password',
                PasswordField::class,
                TextFieldOption::make()
                    ->label(__('Password'))
                    ->placeholder(__('Password'))
                    ->icon('ti ti-lock')
                    ->toArray()
            )
            ->add(
                'password_confirmation',
                PasswordField::class,
                TextFieldOption::make()
                    ->label(__('Password confirmation'))
                    ->placeholder(__('Password confirmation'))
                    ->icon('ti ti-lock')
                    ->toArray()
            )
            ->when(is_plugin_active('captcha'), function (FormAbstract $form) {
                $form
                    ->when(Captcha::isEnabled() && get_ecommerce_setting('enable_recaptcha_in_register_page', false), function (FormAbstract $form) {
                        $form->add('recaptcha', ReCaptchaField::class);
                    })
                    ->when(Captcha::mathCaptchaEnabled() && get_ecommerce_setting('enable_math_captcha_in_register_page', false), function (FormAbstract $form) {
                        $form->add('math_captcha', MathCaptchaField::class);
                    });
            })
            ->add(
                'agree_terms_and_policy',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->when(
                        $privacyPolicyUrl = theme_option('ecommerce_term_and_privacy_policy_url'),
                        function (CheckboxFieldOption $fieldOption, string $url) {
                            $fieldOption->label(__('I agree to the :link', ['link' => Html::link($url, __('Terms and Privacy Policy'), attributes: ['class' => 'text-decoration-underline', 'target' => '_blank'])]));
                        }
                    )
                    ->when(! $privacyPolicyUrl, function (CheckboxFieldOption $fieldOption) {
                        $fieldOption->label(__('I agree to the Terms and Privacy Policy'));
                    })
                    ->toArray()
            )
            ->submitButton(__('Register'), 'ti ti-arrow-narrow-right')
            ->add(
                'login',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('plugins/ecommerce::customers.includes.login-link')
                    ->toArray()
            )
            ->add('filters', HtmlField::class, [
                'html' => apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, Customer::class),
            ]);
    }
}
