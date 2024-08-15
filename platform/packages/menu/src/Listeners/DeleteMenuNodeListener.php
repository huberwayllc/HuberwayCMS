<?php

namespace HuberwayCMS\Menu\Listeners;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Menu\Facades\Menu;
use HuberwayCMS\Menu\Models\MenuNode;

class DeleteMenuNodeListener
{
    public function handle(DeletedContentEvent $event): void
    {
        if (! in_array($event->data::class, Menu::getMenuOptionModels())) {
            return;
        }

        MenuNode::query()
            ->where([
                'reference_id' => $event->data->getKey(),
                'reference_type' => get_class($event->data),
            ])
            ->delete();
    }
}
