<?php

namespace HuberwayCMS\Language\Listeners;

use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Language\Facades\Language;
use Exception;

class UpdatedContentListener
{
    public function handle(UpdatedContentEvent $event): void
    {
        try {
            if ($event->request->input('language')) {
                Language::saveLanguage($event->screen, $event->request, $event->data);
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
