<?php

namespace HuberwayCMS\ACL\Events;

use HuberwayCMS\ACL\Models\Role;
use HuberwayCMS\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class RoleUpdateEvent extends Event
{
    use SerializesModels;

    public function __construct(public Role $role)
    {
    }
}
