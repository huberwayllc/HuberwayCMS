<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Customers;

use HuberwayCMS\ACL\Traits\ResetsPasswords;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Forms\Fronts\Auth\ResetPasswordForm;
use HuberwayCMS\SeoHelper\Facades\SeoHelper;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Contracts\Auth\StatefulGuard;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;

class ResetPasswordController extends BaseController
{
    use ResetsPasswords;

    public string $redirectTo = '/';

    public function __construct()
    {
        $this->middleware('customer.guest');
    }

    public function showResetForm(Request $request, $token = null)
    {
        SeoHelper::setTitle(__('Reset Password'));

        Theme::breadcrumb()
            ->add(__('Reset Password'), route('customer.password.reset'));

        return Theme::scope(
            'ecommerce.customers.passwords.reset',
            [
                'token' => $token,
                'email' => $request->input('email'),
                'form' => ResetPasswordForm::create(),
            ],
            'plugins/ecommerce::themes.customers.passwords.reset'
        )->render();
    }

    public function broker(): PasswordBroker
    {
        return Password::broker('customers');
    }

    protected function guard(): StatefulGuard
    {
        return auth('customer');
    }
}
