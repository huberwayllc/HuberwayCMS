<?php

namespace HuberwayCMS\Ecommerce\Forms\Settings;

use HuberwayCMS\Base\Forms\FieldOptions\CheckboxFieldOption;
use HuberwayCMS\Base\Forms\Fields\HtmlField;
use HuberwayCMS\Base\Forms\Fields\OnOffCheckboxField;
use HuberwayCMS\Ecommerce\Facades\FlashSale;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\FlashSaleSettingRequest;
use HuberwayCMS\Setting\Forms\SettingForm;

class FlashSaleSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.flash_sale.name'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.flash_sale.description'))
            ->setValidatorClass(FlashSaleSettingRequest::class)
            ->add(
                'flash_sale_enabled',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.flash_sale.enable'))
                    ->value(FlashSale::isEnabled())
                    ->attributes([
                        'data-bb-toggle' => 'collapse',
                        'data-bb-target' => '#flash-sale-settings',
                    ])
                    ->toArray(),
            )
            ->add('open_wrapper', HtmlField::class, [
                'html' => sprintf('<div id="flash-sale-settings" style="display: %s">', get_ecommerce_setting('flash_sale_enabled', true) ? 'block' : 'none'),
            ])
            ->add('close_wrapper', HtmlField::class, [
                'html' => '</div>',
            ]);
    }
}
