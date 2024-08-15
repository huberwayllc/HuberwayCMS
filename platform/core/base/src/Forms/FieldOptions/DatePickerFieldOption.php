<?php

namespace HuberwayCMS\Base\Forms\FieldOptions;

use HuberwayCMS\Base\Facades\BaseHelper;
use Carbon\Carbon;

class DatePickerFieldOption extends InputFieldOption
{
    public static function make(): static
    {
        return parent::make()
            ->defaultValue(BaseHelper::formatDate(Carbon::now()));
    }
}
