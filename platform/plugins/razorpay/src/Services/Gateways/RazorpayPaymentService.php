<?php

namespace HuberwayCMS\Razorpay\Services\Gateways;

use HuberwayCMS\Razorpay\Services\Abstracts\RazorpayPaymentAbstract;
use Illuminate\Http\Request;

class RazorpayPaymentService extends RazorpayPaymentAbstract
{
    public function makePayment(Request $request)
    {
    }

    public function afterMakePayment(Request $request)
    {
    }
}
