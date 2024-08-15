<?php

namespace HuberwayCMS\Contact\Http\Requests;

use HuberwayCMS\Base\Rules\EmailRule;
use HuberwayCMS\Base\Rules\PhoneNumberRule;
use HuberwayCMS\Captcha\Facades\Captcha;
use HuberwayCMS\Support\Http\Requests\Request;

class ContactRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'name' => ['required', 'string', 'max:40'],
            'email' => ['required', new EmailRule(), 'max:80'],
            'content' => ['required', 'string', 'max:1000'],
            'phone' => ['nullable', new PhoneNumberRule()],
        ];

        if (is_plugin_active('captcha')) {
            $rules += Captcha::rules();

            if (setting('enable_math_captcha_for_contact_form', 0)) {
                $rules += Captcha::mathCaptchaRules();
            }
        }

        return $rules;
    }

    public function attributes(): array
    {
        return [
            'name' => __('Name'),
            'email' => __('Email'),
            'phone' => __('Phone'),
            'content' => __('Content'),
        ] + (is_plugin_active('captcha') ? Captcha::attributes() : []);
    }
}
