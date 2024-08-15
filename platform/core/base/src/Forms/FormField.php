<?php

namespace HuberwayCMS\Base\Forms;

use HuberwayCMS\Base\Traits\Forms\CanSpanColumns;
use Kris\LaravelFormBuilder\Fields\FormField as BaseFormField;

abstract class FormField extends BaseFormField
{
    use CanSpanColumns;
}
