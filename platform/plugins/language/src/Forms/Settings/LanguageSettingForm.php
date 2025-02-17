<?php

namespace HuberwayCMS\Language\Forms\Settings;

use HuberwayCMS\Base\Forms\FieldOptions\AlertFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\HtmlFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\OnOffFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\RadioFieldOption;
use HuberwayCMS\Base\Forms\Fields\AlertField;
use HuberwayCMS\Base\Forms\Fields\HtmlField;
use HuberwayCMS\Base\Forms\Fields\MultiCheckListField;
use HuberwayCMS\Base\Forms\Fields\OnOffCheckboxField;
use HuberwayCMS\Base\Forms\Fields\RadioField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Language\Facades\Language;
use HuberwayCMS\Language\Http\Requests\Settings\LanguageSettingRequest;
use HuberwayCMS\Setting\Models\Setting;

class LanguageSettingForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Setting::class)
            ->setUrl(route('languages.settings'))
            ->setMethod('POST')
            ->setFormOption('class', 'language-settings-form')
            ->contentOnly()
            ->setValidatorClass(LanguageSettingRequest::class)
            ->add(
                'language_hide_default',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/language::language.language_hide_default'))
                    ->value(setting('language_hide_default', true))
                    ->toArray()
            )
            ->add(
                'language_display',
                RadioField::class,
                RadioFieldOption::make()
                ->label(trans('plugins/language::language.language_display'))
                ->choices([
                    'all' => trans('plugins/language::language.language_display_all'),
                    'flag' => trans('plugins/language::language.language_display_flag_only'),
                    'name' => trans('plugins/language::language.language_display_name_only'),
                ])
                ->selected(setting('language_display', 'all'))
                ->toArray()
            )
            ->add(
                'language_switcher_display',
                'customRadio',
                RadioFieldOption::make()
                    ->label(trans('plugins/language::language.switcher_display'))
                    ->choices([
                        'dropdown' => trans('plugins/language::language.language_switcher_display_dropdown'),
                        'list' => trans('plugins/language::language.language_switcher_display_list'),
                    ])
                    ->selected(setting('language_switcher_display', 'dropdown'))
                    ->toArray()
            );

        if ($languageActives = Language::getActiveLanguage()) {
            $choices = [];
            foreach ($languageActives as $language) {
                if (! $language->lang_is_default) {
                    $choices[$language->lang_id] = $language->lang_name;
                }
            }

            if ($choices) {
                $this
                    ->add(
                        'language_hide_languages[]',
                        MultiCheckListField::class,
                        MultiChecklistFieldOption::make()
                            ->label(trans('plugins/language::language.hide_languages'))
                            ->choices($choices)
                            ->selected(json_decode(setting('language_hide_languages', '[]'), true))
                            ->toArray()
                    );
            }
        }

        $this->add(
            'hide_languages_helper_display_hidden',
            AlertField::class,
            AlertFieldOption::make()
                ->content(
                    trans_choice(
                        'plugins/language::language.hide_languages_helper_display_hidden',
                        ! empty(json_decode(setting('language_hide_languages', '[]'), true)),
                        ['language' => Language::getHiddenLanguageText()]
                    )
                )
                ->toArray()
        )
        ->add(
            'language_show_default_item_if_current_version_not_existed',
            OnOffCheckboxField::class,
            OnOffFieldOption::make()
                ->label(trans('plugins/language::language.language_show_default_item_if_current_version_not_existed'))
                ->value(setting('language_show_default_item_if_current_version_not_existed', true))
                ->toArray()
        )
        ->add(
            'language_auto_detect_user_language',
            OnOffCheckboxField::class,
            OnOffFieldOption::make()
                ->label(trans('plugins/language::language.language_auto_detect_user_language'))
                ->value(setting('language_auto_detect_user_language', false))
                ->toArray()
        )
        ->add(
            'button_action',
            HtmlField::class,
            HtmlFieldOption::make()->view('plugins/language::forms.button-action')->toArray()
        );
    }
}
