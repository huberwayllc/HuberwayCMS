<?php

namespace HuberwayCMS\ACL\Forms\Auth;

use HuberwayCMS\ACL\Http\Requests\ForgotPasswordRequest;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Forms\FieldOptions\TextFieldOption;
use HuberwayCMS\Base\Forms\Fields\HtmlField;
use HuberwayCMS\Base\Forms\Fields\TextField;

class ForgotPasswordForm extends AuthForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setValidatorClass(ForgotPasswordRequest::class)
            ->setUrl(route('access.password.email'))
            ->heading(trans('core/acl::auth.forgot_password.title'))
            ->add('description', HtmlField::class, [
                'html' => BaseHelper::clean(trans('core/acl::auth.forgot_password.message')),
            ])
            ->add(
                'email',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('core/acl::auth.login.email'))
                    ->value(old('email'))
                    ->placeholder(trans('core/acl::auth.login.placeholder.email'))
                    ->required()
                    ->toArray()
            )
            ->submitButton(trans('core/acl::auth.forgot_password.submit'), 'ti ti-mail')
            ->add('back_to_login', HtmlField::class, [
                'html' => sprintf(
                    '<div class="mt-3 text-center"><a href="%s">%s</a></div>',
                    route('access.login'),
                    trans('core/acl::auth.back_to_login')
                ),
            ]);
    }
}
