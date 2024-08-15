<?php

namespace HuberwayCMS\Base\Listeners;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Models\MetaBox;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            do_action(BASE_ACTION_AFTER_DELETE_CONTENT, $event->screen, $event->request, $event->data);

            MetaBox::query()->where([
                'reference_id' => $event->data->getKey(),
                'reference_type' => get_class($event->data),
            ])->delete();
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
