<?php

namespace HuberwayCMS\Ecommerce\Listeners;

use HuberwayCMS\Payment\Enums\PaymentMethodEnum;
use HuberwayCMS\Payment\Facades\PaymentMethods;

class RegisterCodPaymentMethod
{
    public function handle(): void
    {
        PaymentMethods::method(PaymentMethodEnum::COD, [
            'html' => view('plugins/ecommerce::orders.partials.cod')->render(),
            'priority' => 998,
        ]);
    }
}
