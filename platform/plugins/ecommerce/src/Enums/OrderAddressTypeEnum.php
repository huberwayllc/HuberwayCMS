<?php

namespace HuberwayCMS\Ecommerce\Enums;

use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static OrderAddressTypeEnum SHIPPING()
 * @method static OrderAddressTypeEnum BILLING()
 */
class OrderAddressTypeEnum extends Enum
{
    public const SHIPPING = 'shipping_address';
    public const BILLING = 'billing_address';

    public static $langPath = 'plugins/ecommerce::order.order_address_types';

    public function toHtml(): HtmlString|string
    {
        return match ($this->value) {
            self::SHIPPING => Html::tag('span', self::SHIPPING()->label(), ['class' => 'text-success'])
                ->toHtml(),
            self::BILLING => Html::tag('span', self::BILLING()->label(), ['class' => 'text-info'])
                ->toHtml(),
            default => parent::toHtml(),
        };
    }
}
