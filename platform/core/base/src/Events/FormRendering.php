<?php

namespace HuberwayCMS\Base\Events;

use HuberwayCMS\Base\Forms\FormAbstract;
use Illuminate\Foundation\Events\Dispatchable;

class FormRendering
{
    use Dispatchable;

    public function __construct(public FormAbstract $form)
    {
    }
}
