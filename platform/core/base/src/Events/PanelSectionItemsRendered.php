<?php

namespace HuberwayCMS\Base\Events;

use HuberwayCMS\Base\Contracts\PanelSections\PanelSection;
use Illuminate\Foundation\Events\Dispatchable;

class PanelSectionItemsRendered
{
    use Dispatchable;

    public function __construct(public PanelSection $section, public array $items, public string $content)
    {
    }
}
