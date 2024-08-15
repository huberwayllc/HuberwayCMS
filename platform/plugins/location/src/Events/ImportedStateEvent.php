<?php

namespace HuberwayCMS\Location\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Location\Models\State;
use Illuminate\Queue\SerializesModels;

class ImportedStateEvent extends Event
{
    use SerializesModels;

    public function __construct(public array $row, public State $state)
    {
    }
}
