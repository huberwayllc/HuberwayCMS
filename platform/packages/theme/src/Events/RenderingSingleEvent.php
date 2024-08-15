<?php

namespace HuberwayCMS\Theme\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Slug\Models\Slug;
use Illuminate\Queue\SerializesModels;

class RenderingSingleEvent extends Event
{
    use SerializesModels;

    public function __construct(public Slug $slug)
    {
    }
}
