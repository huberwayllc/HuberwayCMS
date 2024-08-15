<?php

namespace HuberwayCMS\Base\Forms\FieldTypes;

use HuberwayCMS\Base\Traits\Forms\CanSpanColumns;

class CollectionType extends \Kris\LaravelFormBuilder\Fields\CollectionType
{
    use CanSpanColumns;
}
