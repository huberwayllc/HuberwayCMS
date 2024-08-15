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
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Forms\Fronts\Auth\FieldOptions\EmailFieldOption;
use HuberwayCMS\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use HuberwayCMS\Ecommerce\Http\Requests\LoginRequest;
use HuberwayCMS\Ecommerce\Models\Customer;

class LoginForm extends AuthForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setUrl(route('customer.login.post'))
            ->setValidatorClass(LoginRequest::class)
            ->icon('ti ti-lock')
            ->heading(__('Login to your account'))
            ->description(__('Your personal data will be used to support your experience throughout this website, to manage access to your account.'))
            ->when(
                theme_option('login_background'),
                fn (AuthForm $form, string $background) => $form->banner($background)
            )
            ->when(EcommerceHelper::isLoginUsingPhone(), function (LoginForm $form) {
                $form->add(
                    'phone',
                    PhoneNumberField::class,
                    TextFieldOption::make()
                        ->label(__('Phone'))
                        ->placeholder(__('Phone number'))
                        ->icon('ti ti-phone')
                        ->toArray()
                );
            }, function (LoginForm $form) {
                $form->add(
                    'email',
                    EmailField::class,
                    EmailFieldOption::make()
                        ->label(__('Email'))
                        ->placeholder(__('Email address'))
                        ->icon('ti ti-mail')
                        ->toArray()
                );
            })
            ->add(
                'password',
                PasswordField::class,
                TextFieldOption::make()
                    ->label(__('Password'))
                    ->placeholder(__('Password'))
                    ->icon('ti ti-lock')
                    ->toArray()
            )
            ->add('openRow', HtmlField::class, [
                'html' => '<div class="row g-0 mb-3">',
            ])
            ->add(
                'remember',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(__('Remember me'))
                    ->wrapperAttributes(['class' => 'col-6'])
                    ->toArray()
            )
            ->add(
                'forgot_password',
                HtmlField::class,
                [
                    'html' => Html::link(route('customer.password.reset'), __('Forgot password?'), attributes: ['class' => 'text-decoration-underline']),
                    'wrapper' => [
                        'class' => 'col-6 text-end',
                    ],
                ]
            )
            ->add('closeRow', HtmlField::class, [
                'html' => '</div>',
            ])
            ->submitButton(__('Login'), 'ti ti-arrow-narrow-right')
            ->add(
                'register',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('plugins/ecommerce::customers.includes.register-link')
                    ->toArray()
            )
            ->add('filters', HtmlField::class, [
                'html' => apply_filters(BASE_FILTER_AFTER_LOGIN_OR_REGISTER_FORM, null, Customer::class),
            ]);
    }
}
