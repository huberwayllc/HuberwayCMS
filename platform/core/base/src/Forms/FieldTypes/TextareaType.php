<?php

namespace HuberwayCMS\Base\Forms\FieldTypes;

use HuberwayCMS\Base\Traits\Forms\CanSpanColumns;

class TextareaType extends \Kris\LaravelFormBuilder\Fields\TextareaType
{
    use CanSpanColumns;
}
