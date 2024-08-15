<?php

namespace HuberwayCMS\Captcha\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class ReCaptchaField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/captcha::forms.fields.recaptcha';
    }
}
