<?php

namespace HuberwayCMS\Base\Listeners;

use HuberwayCMS\Base\Events\BeforeEditContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use Exception;

class BeforeEditContentListener
{
    public function handle(BeforeEditContentEvent $event): void
    {
        try {
            do_action(BASE_ACTION_BEFORE_EDIT_CONTENT, $event->request, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
