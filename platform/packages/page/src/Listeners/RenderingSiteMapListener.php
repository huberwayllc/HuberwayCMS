<?php

namespace HuberwayCMS\Page\Listeners;

use HuberwayCMS\Base\Supports\RepositoryHelper;
use HuberwayCMS\Page\Models\Page;
use HuberwayCMS\Theme\Events\RenderingSiteMapEvent;
use HuberwayCMS\Theme\Facades\SiteMapManager;

class RenderingSiteMapListener
{
    public function handle(RenderingSiteMapEvent $event): void
    {
        if ($event->key == 'pages') {
            $pages = Page::query()
                ->wherePublished()
                ->orderByDesc('created_at')
                ->select(['id', 'name', 'updated_at'])
                ->with('slugable');

            $pages = RepositoryHelper::applyBeforeExecuteQuery($pages, new Page())->get();

            foreach ($pages as $page) {
                SiteMapManager::add($page->url, $page->updated_at, '0.8');
            }
        }
    }
}
