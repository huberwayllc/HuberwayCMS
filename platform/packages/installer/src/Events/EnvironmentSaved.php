<?php

namespace HuberwayCMS\Installer\Events;

use HuberwayCMS\Base\Events\Event;
use Illuminate\Http\Request;

class EnvironmentSaved extends Event
{
    public function __construct(public Request $request)
    {
    }
}
