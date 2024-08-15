<?php

namespace HuberwayCMS\Base\Events;

use HuberwayCMS\Base\Contracts\PanelSections\PanelSectionItem;
use Illuminate\Foundation\Events\Dispatchable;

class PanelSectionItemRendered
{
    use Dispatchable;

    public function __construct(public PanelSectionItem $item, public string $content)
    {

    }
}
