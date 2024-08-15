<?php

namespace HuberwayCMS\Ecommerce\Enums;

use HuberwayCMS\Base\Supports\Enum;

/**
 * @method static ShippingMethodEnum DEFAULT()
 */
class ShippingMethodEnum extends Enum
{
    public const DEFAULT = 'default';
    public const NONE = '';

    public static $langPath = 'plugins/ecommerce::shipping.methods';
}
