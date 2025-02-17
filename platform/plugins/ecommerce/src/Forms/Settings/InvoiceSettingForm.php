<?php

namespace HuberwayCMS\Ecommerce\Forms\Settings;

use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\TextFieldOption;
use HuberwayCMS\Base\Forms\Fields\GoogleFontsField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Facades\InvoiceHelper;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\InvoiceSettingRequest;
use HuberwayCMS\Setting\Forms\SettingForm;

class InvoiceSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.invoice.company_settings'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.invoice.company_settings_description'))
            ->setValidatorClass(InvoiceSettingRequest::class)
            ->columns(6)
            ->add(
                'company_name_for_invoicing',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.invoice.form.company_name'))
                    ->value(get_ecommerce_setting('company_name_for_invoicing', get_ecommerce_setting('store_name')))
                    ->colspan(6)
                    ->toArray()
            )
            ->add(
                'company_address_for_invoicing',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.invoice.form.company_address'))
                    ->value(get_ecommerce_setting('company_address_for_invoicing', implode(
                        ', ',
                        array_filter([
                            get_ecommerce_setting('store_address'),
                            InvoiceHelper::getCompanyCity(),
                            InvoiceHelper::getCompanyState(),
                            InvoiceHelper::getCompanyCountry(),
                        ]),
                    )))
                    ->colspan(6)
                    ->toArray()
            )
            ->add(
                'company_country_for_invoicing',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::ecommerce.country'))
                    ->choices(EcommerceHelper::getAvailableCountries())
                    ->selected(InvoiceHelper::getCompanyCountry())
                    ->searchable()
                    ->colspan(2)
                    ->toArray(),
            )
            ->add(
                'company_state_for_invoicing',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::ecommerce.state'))
                    ->value(InvoiceHelper::getCompanyState())
                    ->colspan(2)
                    ->toArray()
            )
            ->add(
                'company_city_for_invoicing',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::ecommerce.city'))
                    ->value(InvoiceHelper::getCompanyCity())
                    ->colspan(2)
                    ->toArray()
            )
            ->when(EcommerceHelper::isZipCodeEnabled(), function (FormAbstract $form) {
                $form->add('company_zipcode_for_invoicing', TextField::class, [
                    'label' => trans('plugins/ecommerce::setting.invoice.form.company_zipcode'),
                    'value' => InvoiceHelper::getCompanyZipCode(),
                    'colspan' => 3,
                ]);
            })
            ->add('company_email_for_invoicing', 'email', [
                'label' => trans('plugins/ecommerce::setting.invoice.form.company_email'),
                'value' => get_ecommerce_setting('company_email_for_invoicing') ?: get_ecommerce_setting('store_email'),
                'colspan' => 3,
            ])
            ->add('company_phone_for_invoicing', TextField::class, [
                'label' => trans('plugins/ecommerce::setting.invoice.form.company_phone'),
                'value' => get_ecommerce_setting('company_phone_for_invoicing') ?: get_ecommerce_setting('store_phone'),
                'colspan' => 3,
            ])
            ->add('company_tax_id_for_invoicing', TextField::class, [
                'label' => trans('plugins/ecommerce::setting.invoice.form.company_tax_id'),
                'value' => get_ecommerce_setting('company_tax_id_for_invoicing') ?: get_ecommerce_setting('store_vat_number'),
                'colspan' => 6,
            ])
            ->add('company_logo_for_invoicing', 'mediaImage', [
                'value' => get_ecommerce_setting('company_logo_for_invoicing') ?: (theme_option('logo_in_invoices') ?: theme_option('logo')),
                'allow_thumb' => false,
                'colspan' => 6,
            ])
            ->add('using_custom_font_for_invoice', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.invoice.form.using_custom_font_for_invoice'),
                'value' => get_ecommerce_setting('using_custom_font_for_invoice', false),
                'attr' => [
                    'data-bb-toggle' => 'collapse',
                    'data-bb-target' => '.custom-font-settings',
                ],
                'colspan' => 6,
            ])
            ->add('open_fieldset_custom_font_settings', 'html', [
                'html' => sprintf(
                    '<fieldset class="form-fieldset custom-font-settings w-100" style="display: %s;" data-bb-value="1">',
                    get_ecommerce_setting('using_custom_font_for_invoice', false) ? 'block' : 'none'
                ),
            ])
            ->add('invoice_font_family', GoogleFontsField::class, [
                'label' => trans('plugins/ecommerce::setting.invoice.form.invoice_font_family'),
                'selected' => get_ecommerce_setting('invoice_font_family'),
                'colspan' => 6,
            ])
            ->add('close_fieldset_custom_font_settings', 'html', [
                'html' => '</fieldset>',
            ])
            ->add('invoice_support_arabic_language', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.invoice.form.invoice_support_arabic_language'),
                'value' => get_ecommerce_setting('invoice_support_arabic_language', false),
                'colspan' => 6,
            ])
            ->add('enable_invoice_stamp', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.invoice.form.enable_invoice_stamp'),
                'value' => get_ecommerce_setting('enable_invoice_stamp', true),
                'colspan' => 6,
            ])
            ->add('invoice_code_prefix', TextField::class, [
                'label' => trans('plugins/ecommerce::setting.invoice.form.invoice_code_prefix'),
                'value' => get_ecommerce_setting('invoice_code_prefix', 'INV-'),
                'colspan' => 6,
            ])
            ->add('disable_order_invoice_until_order_confirmed', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.invoice.form.disable_order_invoice_until_order_confirmed'),
                'value' => EcommerceHelper::disableOrderInvoiceUntilOrderConfirmed(),
                'colspan' => 6,
            ]);
    }
}
