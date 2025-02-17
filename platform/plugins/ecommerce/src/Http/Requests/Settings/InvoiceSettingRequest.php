<?php

namespace HuberwayCMS\Ecommerce\Http\Requests\Settings;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class InvoiceSettingRequest extends Request
{
    public function rules(): array
    {
        $googleFonts = config('core.base.general.google_fonts', []);

        $customGoogleFonts = config('core.base.general.custom_google_fonts');

        if ($customGoogleFonts) {
            $googleFonts = array_merge($googleFonts, explode(',', $customGoogleFonts));
        }

        return [
            'company_name_for_invoicing' => ['nullable', 'string', 'max:120'],
            'company_address_for_invoicing' => ['nullable', 'string', 'max:255'],
            'company_country_for_invoicing' => ['nullable', 'string', 'max:120'],
            'company_state_for_invoicing' => ['nullable', 'string', 'max:120'],
            'company_city_for_invoicing' => ['nullable', 'string', 'max:120'],
            'company_email_for_invoicing' => ['nullable', 'email'],
            'company_phone_for_invoicing' => 'sometimes|' . BaseHelper::getPhoneValidationRule(),
            'company_tax_id_for_invoicing' => ['nullable', 'string', 'max:120'],
            'company_logo_for_invoicing' => ['nullable', 'string', 'max:255'],
            'using_custom_font_for_invoice' => $onOffRule = new OnOffRule(),
            'invoice_support_arabic_language' => $onOffRule,
            'enable_invoice_stamp' => $onOffRule,
            'invoice_code_prefix' => ['nullable', 'string', 'max:120'],
            'disable_order_invoice_until_order_confirmed' => $onOffRule,
            'invoice_font_family' => ['nullable', Rule::in($googleFonts)],
        ];
    }
}
