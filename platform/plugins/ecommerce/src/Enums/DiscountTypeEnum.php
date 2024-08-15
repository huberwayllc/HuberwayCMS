<?php

namespace HuberwayCMS\Ecommerce\Enums;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static DiscountTypeEnum COUPON()
 * @method static DiscountTypeEnum PROMOTION()
 */
class DiscountTypeEnum extends Enum
{
    public const COUPON = 'coupon';

    public const PROMOTION = 'promotion';

    public static $langPath = 'plugins/ecommerce::discount.enums.types';

    public function toHtml(): HtmlString|string
    {
        $color = match ($this->value) {
            self::COUPON => 'info',
            self::PROMOTION => 'success',
            default => 'primary',
        };

        return BaseHelper::renderBadge($this->label(), $color);
    }
}
