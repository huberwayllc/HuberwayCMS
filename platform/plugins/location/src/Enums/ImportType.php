<?php

namespace HuberwayCMS\Location\Enums;

use HuberwayCMS\Base\Supports\Enum;

class ImportType extends Enum
{
    public const COUNTRY = 'country';

    public const STATE = 'state';

    public const CITY = 'city';

    protected static $langPath = 'plugins/location::location.enums.import_type';
}
