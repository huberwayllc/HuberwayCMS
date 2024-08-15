<?php

namespace HuberwayCMS\Faq\Listeners;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\MetaBox;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            MetaBox::deleteMetaData($event->data, 'faq_schema_config');
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
