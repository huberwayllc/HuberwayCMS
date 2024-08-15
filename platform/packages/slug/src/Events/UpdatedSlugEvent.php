<?php

namespace HuberwayCMS\Slug\Events;

use HuberwayCMS\Base\Events\Event;
use HuberwayCMS\Slug\Models\Slug;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UpdatedSlugEvent extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public bool|Model|null $data, public Slug $slug)
    {
    }
}
