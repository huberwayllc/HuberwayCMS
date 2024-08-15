<?php

namespace HuberwayCMS\ACL\Listeners;

use HuberwayCMS\ACL\Models\User;
use Illuminate\Auth\Events\Login;

class LoginListener
{
    public function handle(Login $event): void
    {
        if (! $event->user instanceof User) {
            return;
        }
    }
}
