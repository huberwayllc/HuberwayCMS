<?php

namespace HuberwayCMS\Theme\Events;

use HuberwayCMS\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class RenderingHomePageEvent extends Event
{
    use SerializesModels;
}
