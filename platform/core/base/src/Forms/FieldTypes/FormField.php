<?php

namespace HuberwayCMS\Base\Forms\FieldTypes;

use HuberwayCMS\Base\Traits\Forms\CanSpanColumns;

abstract class FormField extends \Kris\LaravelFormBuilder\Fields\FormField
{
    use CanSpanColumns;
}
