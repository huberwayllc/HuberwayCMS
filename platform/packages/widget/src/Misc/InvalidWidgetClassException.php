<?php

namespace HuberwayCMS\Widget\Misc;

use HuberwayCMS\Widget\AbstractWidget;
use Exception;

class InvalidWidgetClassException extends Exception
{
    protected $message = 'Widget class must extend class ' . AbstractWidget::class;
}
