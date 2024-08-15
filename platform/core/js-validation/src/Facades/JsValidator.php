<?php

namespace HuberwayCMS\JsValidation\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @method static \HuberwayCMS\JsValidation\Javascript\JavascriptValidator make(array $rules, array $messages = [], array $customAttributes = [], string|null $selector = null)
 * @method static \HuberwayCMS\JsValidation\Javascript\JavascriptValidator formRequest($formRequest, $selector = null)
 * @method static \HuberwayCMS\JsValidation\Javascript\JavascriptValidator validator(\Illuminate\Validation\Validator $validator, string|null $selector = null)
 *
 * @see \HuberwayCMS\JsValidation\JsValidatorFactory
 */
class JsValidator extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'js-validator';
    }
}
