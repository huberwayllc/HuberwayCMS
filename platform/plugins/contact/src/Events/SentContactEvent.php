<?php

namespace HuberwayCMS\Contact\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Base\Models\BaseModel;
use Illuminate\Queue\SerializesModels;

class SentContactEvent extends Event
{
    use SerializesModels;

    public function __construct(public bool|BaseModel|null $data)
    {
    }
}
