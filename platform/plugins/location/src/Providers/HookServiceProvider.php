<?php

namespace HuberwayCMS\Location\Providers;

use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Base\Forms\FormHelper;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Location\Fields\SelectLocationField;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        add_filter('form_custom_fields', function (FormAbstract $form, FormHelper $formHelper) {
            if (! $formHelper->hasCustomField('selectLocation')) {
                $form->addCustomField('selectLocation', SelectLocationField::class);
            }

            return $form;
        }, 29, 2);
    }
}
