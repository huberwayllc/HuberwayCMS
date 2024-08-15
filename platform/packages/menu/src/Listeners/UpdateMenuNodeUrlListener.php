<?php

namespace HuberwayCMS\Menu\Listeners;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Supports\RepositoryHelper;
use HuberwayCMS\Menu\Facades\Menu;
use HuberwayCMS\Menu\Models\MenuNode;
use HuberwayCMS\Slug\Events\UpdatedSlugEvent;
use Exception;

class UpdateMenuNodeUrlListener
{
    public function handle(UpdatedSlugEvent $event): void
    {
        if (! in_array($event->data::class, Menu::getMenuOptionModels())) {
            return;
        }

        try {
            $query = MenuNode::query()
                ->where([
                    'reference_id' => $event->data->getKey(),
                    'reference_type' => $event->data::class,
                ]);

            $nodes = RepositoryHelper::applyBeforeExecuteQuery($query, $event->data)->get();

            foreach ($nodes as $node) {
                $newUrl = str_replace(url(''), '', $node->reference->url);
                if ($node->url != $newUrl) {
                    $node->url = $newUrl;
                    $node->save();
                }
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
