<?php

namespace HuberwayCMS\ACL\Http\Controllers\Auth;

use HuberwayCMS\ACL\Forms\Auth\ForgotPasswordForm;
use HuberwayCMS\ACL\Traits\SendsPasswordResetEmails;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use Illuminate\Http\Request;

class ForgotPasswordController extends BaseController
{
    use SendsPasswordResetEmails;

    public function __construct()
    {
        $this->middleware('guest');
    }

    public function showLinkRequestForm()
    {
        $this->pageTitle(trans('core/acl::auth.forgot_password.title'));

        return ForgotPasswordForm::create()->renderForm();
    }

    protected function sendResetLinkResponse(Request $request, $response)
    {
        return $this
            ->httpResponse()
            ->setMessage(trans($response))
            ->toResponse($request);
    }
}
