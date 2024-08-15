<?php

namespace HuberwayCMS\Ecommerce\Listeners;

use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Customer;
use Illuminate\Auth\Events\Registered;

class SendMailsAfterCustomerRegistered
{
    public function handle(Registered $event): void
    {
        $customer = $event->user;

        if (! $customer instanceof Customer) {
            return;
        }

        EmailHandler::setModule(ECOMMERCE_MODULE_SCREEN_NAME)
            ->setVariableValues([
                'customer_name' => $customer->name,
            ])
            ->sendUsingTemplate('welcome', $customer->email);

        if (EcommerceHelper::isEnableEmailVerification()) {
            $customer->sendEmailVerificationNotification();
        }
    }
}
