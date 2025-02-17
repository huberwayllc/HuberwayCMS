<?php

namespace HuberwayCMS\Contact\Forms\Settings;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\Fields\TextareaField;
use HuberwayCMS\Contact\Http\Requests\Settings\ContactSettingRequest;
use HuberwayCMS\Setting\Forms\SettingForm;

class ContactSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        Assets::addStylesDirectly('vendor/core/core/base/libraries/tagify/tagify.css')
            ->addScriptsDirectly([
                'vendor/core/core/base/libraries/tagify/tagify.js',
                'vendor/core/core/base/js/tags.js',
            ]);

        $this
            ->setSectionTitle(trans('plugins/contact::contact.settings.title'))
            ->setSectionDescription(trans('plugins/contact::contact.settings.description'))
            ->setValidatorClass(ContactSettingRequest::class)
            ->add('blacklist_keywords', TextareaField::class, [
                'label' => trans('plugins/contact::contact.settings.blacklist_keywords'),
                'value' => setting('blacklist_keywords'),
                'attr' => [
                    'placeholder' => trans('plugins/contact::contact.settings.blacklist_keywords_placeholder'),
                    'class' => 'tags form-control',
                    'rows' => 3,
                    'data-counter' => '250',
                ],
                'wrapper' => [
                    'class' => 'mb-0',
                ],
                'help_block' => [
                    'text' => trans('plugins/contact::contact.settings.blacklist_keywords_helper'),
                ],
            ]);
    }
}
