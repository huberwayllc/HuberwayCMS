<?php

namespace HuberwayCMS\Ecommerce\Enums;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static OrderStatusEnum PENDING()
 * @method static OrderStatusEnum PROCESSING()
 * @method static OrderStatusEnum COMPLETED()
 * @method static OrderStatusEnum CANCELED()
 * @method static OrderStatusEnum PARTIAL_RETURNED()
 * @method static OrderStatusEnum RETURNED()
 */
class OrderStatusEnum extends Enum
{
    public const PENDING = 'pending';

    public const PROCESSING = 'processing';

    public const COMPLETED = 'completed';

    public const CANCELED = 'canceled';

    public const PARTIAL_RETURNED = 'partial_returned';

    public const RETURNED = 'returned';

    public static $langPath = 'plugins/ecommerce::order.statuses';

    public function toHtml(): HtmlString|string
    {
        $color = match ($this->value) {
            self::PENDING => 'warning',
            self::PROCESSING => 'info',
            self::COMPLETED => 'success',
            self::CANCELED, self::RETURNED, self::PARTIAL_RETURNED => 'danger',
            default => 'primary',
        };

        return BaseHelper::renderBadge($this->label(), $color);
    }
}
