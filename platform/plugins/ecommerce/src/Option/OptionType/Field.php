<?php

namespace HuberwayCMS\Ecommerce\Option\OptionType;

use HuberwayCMS\Ecommerce\Option\Interfaces\OptionTypeInterface;

class Field extends BaseOptionType implements OptionTypeInterface
{
    public function view(): string
    {
        return 'field';
    }
}
