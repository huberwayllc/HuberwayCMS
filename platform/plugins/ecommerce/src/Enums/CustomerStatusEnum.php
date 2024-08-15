<?php

namespace HuberwayCMS\Ecommerce\Enums;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static CustomerStatusEnum ACTIVATED()
 * @method static CustomerStatusEnum LOCKED()
 */
class CustomerStatusEnum extends Enum
{
    public const ACTIVATED = 'activated';

    public const LOCKED = 'locked';

    public static $langPath = 'plugins/ecommerce::customer.statuses';

    public function toHtml(): HtmlString|string
    {
        $color = match ($this->value) {
            self::ACTIVATED => 'info',
            self::LOCKED => 'warning',
            default => 'primary',
        };

        return BaseHelper::renderBadge($this->label(), $color);
    }
}
