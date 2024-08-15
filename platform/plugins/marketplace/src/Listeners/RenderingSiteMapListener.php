<?php

namespace HuberwayCMS\Marketplace\Listeners;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Theme\Events\RenderingSiteMapEvent;
use HuberwayCMS\Theme\Facades\SiteMapManager;

class RenderingSiteMapListener
{
    public function handle(RenderingSiteMapEvent $event): void
    {
        if ($key = $event->key) {
            switch ($key) {
                case 'stores':
                    $stores = Store::query()
                        ->with('slugable')
                        ->where('status', BaseStatusEnum::PUBLISHED)
                        ->orderByDesc('created_at')
                        ->select(['id', 'name', 'updated_at'])
                        ->get();

                    foreach ($stores as $store) {
                        if (! $store->slugable) {
                            continue;
                        }

                        SiteMapManager::add($store->url, $store->updated_at, '0.8');
                    }

                    break;
                case 'pages':
                    SiteMapManager::add(route('public.stores'), null, '1', 'monthly');

                    break;
            }
        } else {
            SiteMapManager::addSitemap(SiteMapManager::route('stores'));
        }
    }
}
