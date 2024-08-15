<?php

namespace HuberwayCMS\AuditLog\Listeners;

use HuberwayCMS\AuditLog\Events\AuditHandlerEvent;
use HuberwayCMS\AuditLog\Facades\AuditLog;
use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use Exception;

class CreatedContentListener
{
    public function handle(CreatedContentEvent $event): void
    {
        try {
            if ($event->data->getKey()) {
                $model = $event->screen;

                event(new AuditHandlerEvent(
                    $model,
                    'created',
                    $event->data->getKey(),
                    AuditLog::getReferenceName($model, $event->data),
                    'info'
                ));
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
