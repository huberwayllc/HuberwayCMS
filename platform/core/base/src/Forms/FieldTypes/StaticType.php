<?php

namespace HuberwayCMS\Base\Forms\FieldTypes;

use HuberwayCMS\Base\Traits\Forms\CanSpanColumns;

class StaticType extends \Kris\LaravelFormBuilder\Fields\StaticType
{
    use CanSpanColumns;
}
