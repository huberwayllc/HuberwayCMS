<?php

namespace HuberwayCMS\Base\Listeners;

use HuberwayCMS\Base\Events\SendMailEvent;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Supports\EmailAbstract;
use Exception;
use Illuminate\Contracts\Mail\Mailer;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendMailListener implements ShouldQueue
{
    use InteractsWithQueue;

    public function __construct(protected Mailer $mailer)
    {
    }

    public function handle(SendMailEvent $event): void
    {
        try {
            $this->mailer->to($event->to)->send(new EmailAbstract($event->content, $event->title, $event->args));
        } catch (Exception $exception) {
            if ($event->debug) {
                throw $exception;
            }

            BaseHelper::logError($exception);
        }
    }
}
