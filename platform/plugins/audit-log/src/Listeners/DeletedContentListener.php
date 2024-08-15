<?php

namespace HuberwayCMS\AuditLog\Listeners;

use HuberwayCMS\AuditLog\Events\AuditHandlerEvent;
use HuberwayCMS\AuditLog\Facades\AuditLog;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            if ($event->data->getKey()) {
                $model = $event->screen;

                event(new AuditHandlerEvent(
                    $model,
                    'deleted',
                    $event->data->getKey(),
                    AuditLog::getReferenceName($model, $event->data),
                    'danger'
                ));
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
