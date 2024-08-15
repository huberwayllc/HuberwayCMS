<?php

namespace HuberwayCMS\Location\Events;

use HuberwayCMS\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class DownloadedCountry extends Event
{
    use SerializesModels;
}
