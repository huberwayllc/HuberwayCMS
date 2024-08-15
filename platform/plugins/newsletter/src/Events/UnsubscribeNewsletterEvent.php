<?php

namespace HuberwayCMS\Newsletter\Events;

use HuberwayCMS\Newsletter\Models\Newsletter;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UnsubscribeNewsletterEvent
{
    use Dispatchable;
    use InteractsWithSockets;
    use SerializesModels;

    public function __construct(public Newsletter $newsletter)
    {
    }
}
