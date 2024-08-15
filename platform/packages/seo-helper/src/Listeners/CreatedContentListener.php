<?php

namespace HuberwayCMS\SeoHelper\Listeners;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\SeoHelper\Facades\SeoHelper;
use Exception;

class CreatedContentListener
{
    public function handle(CreatedContentEvent $event): void
    {
        try {
            SeoHelper::saveMetaData($event->screen, $event->request, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
