<?php

namespace HuberwayCMS\Ecommerce\Forms\Fronts\Auth;

use HuberwayCMS\Base\Forms\Fields\HtmlField;
use HuberwayCMS\Base\Forms\Fields\PasswordField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Ecommerce\Forms\Fronts\Auth\FieldOptions\EmailFieldOption;
use HuberwayCMS\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use HuberwayCMS\Ecommerce\Http\Requests\Fronts\Auth\ResetPasswordRequest;

class ResetPasswordForm extends AuthForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setUrl(route('customer.password.reset.post'))
            ->icon('ti ti-lock')
            ->setValidatorClass(ResetPasswordRequest::class)
            ->heading(__('Reset Password'))
            ->add(
                'token',
                'hidden',
                TextFieldOption::make()
                    ->value($this->request->route('token'))
                    ->toArray()
            )
            ->add(
                'email',
                TextField::class,
                EmailFieldOption::make()
                    ->label(__('Email address'))
                    ->value($this->request->input('email'))
                    ->icon('ti ti-mail')
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
            ->submitButton(__('Reset Password'))
            ->add('back_to_login', HtmlField::class, [
                'html' => sprintf(
                    '<div class="mt-3 text-center"><a href="%s" class="text-decoration-underline">%s</a></div>',
                    route('customer.login'),
                    __('Back to login page')
                ),
            ]);
    }
}
