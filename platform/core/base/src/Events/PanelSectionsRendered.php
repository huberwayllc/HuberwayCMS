<?php

namespace HuberwayCMS\Base\Events;

use HuberwayCMS\Base\Contracts\PanelSections\Manager;
use Illuminate\Foundation\Events\Dispatchable;

class PanelSectionsRendered
{
    use Dispatchable;

    public function __construct(public Manager $panelSectionManager)
    {
    }
}
