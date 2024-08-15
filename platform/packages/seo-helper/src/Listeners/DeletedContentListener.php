<?php

namespace HuberwayCMS\SeoHelper\Listeners;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\SeoHelper\Facades\SeoHelper;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            SeoHelper::deleteMetaData($event->screen, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
