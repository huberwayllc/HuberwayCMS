<?php

namespace HuberwayCMS\LanguageAdvanced\Listeners;

use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Support\Services\Cache\Cache;

class ClearCacheAfterUpdateData
{
    public function handle(UpdatedContentEvent $event): void
    {
        if (! setting('enable_cache', false)) {
            return;
        }

        $cache = new Cache(app('cache'), get_class($event->data));
        $cache->flush();
    }
}
