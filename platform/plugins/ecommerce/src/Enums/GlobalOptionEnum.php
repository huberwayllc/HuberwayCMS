<?php

namespace HuberwayCMS\Ecommerce\Enums;

use HuberwayCMS\Base\Supports\Enum;
use HuberwayCMS\Ecommerce\Option\OptionType\Checkbox;
use HuberwayCMS\Ecommerce\Option\OptionType\Dropdown;
use HuberwayCMS\Ecommerce\Option\OptionType\Field;
use HuberwayCMS\Ecommerce\Option\OptionType\RadioButton;

class GlobalOptionEnum extends Enum
{
    public const NA = 'N/A';

    public const FIELD = Field::class;

    public const TYPE_PERCENT = 1;

    public static function options(): array
    {
        return [
            'N/A' => trans('plugins/ecommerce::product-option.please_select_option'),
            'Text' => [
                Field::class => 'Field',
            ],
            'Select' => [
                Dropdown::class => 'Dropdown',
                Checkbox::class => 'Checkbox',
                RadioButton::class => 'RadioButton',
            ],
        ];
    }
}
