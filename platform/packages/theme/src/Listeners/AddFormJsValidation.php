<?php

namespace HuberwayCMS\Theme\Listeners;

use HuberwayCMS\Base\Events\FormRendering;
use HuberwayCMS\Base\Facades\AdminHelper;
use HuberwayCMS\JsValidation\Facades\JsValidator;
use HuberwayCMS\Theme\Facades\Theme;

class AddFormJsValidation
{
    public function handle(FormRendering $event): void
    {
        if (AdminHelper::isInAdmin()) {
            return;
        }

        $form = $event->form;

        if (! $form->getValidatorClass()) {
            return;
        }

        Theme::asset()
            ->container('footer')
            ->usePath(false)
            ->add('js-validation', 'vendor/core/core/js-validation/js/js-validation.js', ['jquery']);

        Theme::asset()
            ->container('footer')
            ->writeContent(
                'js-validation-form-rules',
                JsValidator::formRequest($form->getValidatorClass(), '#' . $form->getFormOption('id'))->render(),
                ['jquery']
            );
    }
}
