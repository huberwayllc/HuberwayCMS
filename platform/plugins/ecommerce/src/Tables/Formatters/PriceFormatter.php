<?php

namespace HuberwayCMS\Ecommerce\Tables\Formatters;

use HuberwayCMS\Table\Formatter;

class PriceFormatter implements Formatter
{
    public function format($value, $row): string
    {
        return format_price($value);
    }
}
