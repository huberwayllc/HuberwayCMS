<?php

namespace HuberwayCMS\Setting\Forms;

use HuberwayCMS\Base\Facades\AdminAppearance;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\Fields\GoogleFontsField;
use HuberwayCMS\Base\Forms\Fields\MediaImageField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Base\Supports\Language;
use HuberwayCMS\Setting\Http\Requests\AdminAppearanceRequest;

class AdminAppearanceSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $locales = collect(Language::getAvailableLocales())
            ->pluck('name', 'locale')
            ->map(fn ($item, $key) => $item . ' - ' . $key)
            ->all();

        $this
            ->setSectionTitle(trans('core/setting::setting.admin_appearance.title'))
            ->setSectionDescription(trans('core/setting::setting.admin_appearance.description'))
            ->setValidatorClass(AdminAppearanceRequest::class)
            ->add('admin_logo', MediaImageField::class, [
                'label' => trans('core/setting::setting.admin_appearance.form.admin_logo'),
                'value' => setting('admin_logo'),
            ])
            ->add('admin_favicon', MediaImageField::class, [
                'label' => trans('core/setting::setting.admin_appearance.form.admin_favicon'),
                'value' => setting('admin_favicon'),
            ])
            ->add('login_screen_backgrounds[]', 'mediaImages', [
                'label' => trans('core/setting::setting.admin_appearance.form.admin_login_screen_backgrounds'),
                'value' => is_array(setting('login_screen_backgrounds', ''))
                    ? setting('login_screen_backgrounds', '')
                    : json_decode(setting('login_screen_backgrounds', ''), true),
                'values' => setting('login_screen_backgrounds', []),
            ])
            ->add('admin_title', TextField::class, [
                'label' => trans('core/setting::setting.admin_appearance.form.admin_title'),
                'value' => setting('admin_title', config('app.name')),
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('admin_primary_font', GoogleFontsField::class, [
                'label' => trans('core/setting::setting.admin_appearance.form.primary_font'),
                'selected' => setting('admin_primary_font', 'Inter'),
            ])
            ->add('admin_primary_color', 'customColor', [
                'label' => trans('core/setting::setting.admin_appearance.form.primary_color'),
                'value' => setting('admin_primary_color', '#206bc4'),
            ])
            ->add('admin_secondary_color', 'customColor', [
                'label' => trans('core/setting::setting.admin_appearance.form.secondary_color'),
                'value' => setting('admin_secondary_color', '#6c7a91'),
            ])
            ->add('admin_heading_color', 'customColor', [
                'label' => trans('core/setting::setting.admin_appearance.form.heading_color'),
                'value' => setting('admin_heading_color', 'inherit'),
            ])
            ->add('admin_text_color', 'customColor', [
                'label' => trans('core/setting::setting.admin_appearance.form.text_color'),
                'value' => setting('admin_text_color', '#182433'),
            ])
            ->add('admin_link_color', 'customColor', [
                'label' => trans('core/setting::setting.admin_appearance.form.link_color'),
                'value' => setting('admin_link_color', '#206bc4'),
            ])
            ->add('admin_link_hover_color', 'customColor', [
                'label' => trans('core/setting::setting.admin_appearance.form.link_hover_color'),
                'value' => setting('admin_link_hover_color', '#1a569d'),
            ])
            ->when(count($locales) > 1, function (FormAbstract $form) use ($locales) {
                $form->add(
                    AdminAppearance::getSettingKey('locale'),
                    SelectField::class,
                    SelectFieldOption::make()
                        ->label(trans('core/setting::setting.general.locale'))
                        ->choices($locales)
                        ->selected(AdminAppearance::getSetting('locale', config('core.base.general.locale', config('app.locale'))))
                        ->searchable()
                        ->toArray()
                );
            })
            ->add(AdminAppearance::getSettingKey('locale_direction'), 'customRadio', [
                'label' => trans('core/setting::setting.admin_appearance.form.admin_locale_direction'),
                'value' => AdminAppearance::getSetting('locale_direction', setting('admin_locale_direction', 'ltr')),
                'values' => [
                    'ltr' => trans('core/setting::setting.locale_direction_ltr'),
                    'rtl' => trans('core/setting::setting.locale_direction_rtl'),
                ],
            ])
            ->add('rich_editor', 'customRadio', [
                'label' => trans('core/setting::setting.admin_appearance.form.rich_editor'),
                'value' => BaseHelper::getRichEditor(),
                'values' => BaseHelper::availableRichEditors(),
            ])
            ->add(AdminAppearance::getSettingKey('layout'), 'customRadio', [
                'label' => trans('core/setting::setting.admin_appearance.layout'),
                'value' => AdminAppearance::getCurrentLayout(),
                'values' => AdminAppearance::getLayouts(),
            ])
            ->add(AdminAppearance::getSettingKey('container_width'), 'customRadio', [
                'label' => trans('core/setting::setting.admin_appearance.container_width.title'),
                'value' => AdminAppearance::getContainerWidth(),
                'values' => AdminAppearance::getContainerWidths(),
            ])
            ->add('show_admin_bar', 'onOffCheckbox', [
                'label' => trans('core/setting::setting.admin_appearance.form.show_admin_bar'),
                'value' => setting('show_admin_bar', true),
            ])
            ->add(AdminAppearance::getSettingKey('show_menu_item_icon'), 'onOffCheckbox', [
                'label' => trans('core/setting::setting.admin_appearance.form.show_menu_item_icon'),
                'value' => AdminAppearance::showMenuItemIcon(),
            ])
            ->add('show_theme_guideline_link', 'onOffCheckbox', [
                'label' => trans('core/setting::setting.admin_appearance.form.show_guidelines'),
                'value' => setting('show_theme_guideline_link', false),
            ]);
    }
}
