<?php

namespace HuberwayCMS\Language\Listeners;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Language\Facades\Language;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            Language::deleteLanguage($event->screen, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
