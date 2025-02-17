<?php

namespace HuberwayCMS\ACL\Http\Middleware;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use Closure;
use Illuminate\Http\Request;

class CheckUserUpdatePermission
{
    public function handle(Request $request, Closure $next)
    {
        $currentUser = $request->user();
        $user = $request->route('user');

        $hasRightToUpdate = $currentUser->hasPermission('users.edit')
            || $currentUser->getKey() === $user->getKey()
            || $currentUser->isSuperUser();

        if (! $hasRightToUpdate) {
            return BaseHttpResponse::make()
                ->setNextUrl($user->url)
                ->setError()
                ->setMessage(trans('core/acl::permissions.access_denied_message'));
        }

        return $next($request);
    }
}
