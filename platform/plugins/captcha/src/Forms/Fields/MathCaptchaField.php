<?php

namespace HuberwayCMS\Captcha\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;

class MathCaptchaField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/captcha::forms.fields.math-captcha';
    }
}
