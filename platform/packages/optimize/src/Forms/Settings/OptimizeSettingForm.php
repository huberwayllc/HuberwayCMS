<?php

namespace HuberwayCMS\Optimize\Forms\Settings;

use HuberwayCMS\Optimize\Http\Requests\OptimizeSettingRequest;
use HuberwayCMS\Setting\Forms\SettingForm;

class OptimizeSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('packages/optimize::optimize.settings.title'))
            ->setSectionDescription(trans('packages/optimize::optimize.settings.description'))
            ->setValidatorClass(OptimizeSettingRequest::class)
            ->add('optimize_fields', 'html', [
                'html' => view('packages/optimize::partials.settings.forms.optimize-fields')->render(),
            ]);
    }
}
