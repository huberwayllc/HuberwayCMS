<?php

namespace HuberwayCMS\ACL\Events;

use HuberwayCMS\ACL\Models\Role;
use HuberwayCMS\ACL\Models\User;
use HuberwayCMS\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class RoleAssignmentEvent extends Event
{
    use SerializesModels;

    public function __construct(public Role $role, public User $user)
    {
    }
}
