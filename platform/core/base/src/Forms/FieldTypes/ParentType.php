<?php

namespace HuberwayCMS\Base\Forms\FieldTypes;

use HuberwayCMS\Base\Traits\Forms\CanSpanColumns;

abstract class ParentType extends \Kris\LaravelFormBuilder\Fields\ParentType
{
    use CanSpanColumns;
}
