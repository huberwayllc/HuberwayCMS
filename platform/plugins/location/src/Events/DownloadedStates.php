<?php

namespace HuberwayCMS\Location\Events;

use HuberwayCMS\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class DownloadedStates extends Event
{
    use SerializesModels;
}
