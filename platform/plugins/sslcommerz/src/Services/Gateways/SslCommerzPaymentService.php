<?php

namespace HuberwayCMS\SslCommerz\Services\Gateways;

use HuberwayCMS\SslCommerz\Services\Abstracts\SslCommerzPaymentAbstract;
use Illuminate\Http\Request;

class SslCommerzPaymentService extends SslCommerzPaymentAbstract
{
    public function makePayment(Request $request)
    {
    }

    public function afterMakePayment(Request $request)
    {
    }
}
