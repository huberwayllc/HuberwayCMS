<?php

namespace HuberwayCMS\Theme\Events;

use HuberwayCMS\Base\Events\Event;

class RenderingSiteMapEvent extends Event
{
    public function __construct(public string|null $key = null)
    {
    }
}
