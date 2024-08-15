<?php

namespace HuberwayCMS\Newsletter\Providers;

use HuberwayCMS\Newsletter\Events\SubscribeNewsletterEvent;
use HuberwayCMS\Newsletter\Events\UnsubscribeNewsletterEvent;
use HuberwayCMS\Newsletter\Listeners\AddSubscriberToMailchimpContactListListener;
use HuberwayCMS\Newsletter\Listeners\AddSubscriberToSendGridContactListListener;
use HuberwayCMS\Newsletter\Listeners\RemoveSubscriberToMailchimpContactListListener;
use HuberwayCMS\Newsletter\Listeners\SendEmailNotificationAboutNewSubscriberListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        SubscribeNewsletterEvent::class => [
            SendEmailNotificationAboutNewSubscriberListener::class,
            AddSubscriberToMailchimpContactListListener::class,
            AddSubscriberToSendGridContactListListener::class,
        ],
        UnsubscribeNewsletterEvent::class => [
            RemoveSubscriberToMailchimpContactListListener::class,
        ],
    ];
}
