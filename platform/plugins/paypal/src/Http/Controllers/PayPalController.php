<?php

namespace HuberwayCMS\PayPal\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Payment\Supports\PaymentHelper;
use HuberwayCMS\PayPal\Http\Requests\PayPalPaymentCallbackRequest;
use HuberwayCMS\PayPal\Services\Gateways\PayPalPaymentService;

class PayPalController extends BaseController
{
    public function getCallback(
        PayPalPaymentCallbackRequest $request,
        PayPalPaymentService $payPalPaymentService,
        BaseHttpResponse $response
    ) {
        $status = $payPalPaymentService->getPaymentStatus($request);

        if (! $status) {
            return $response
                ->setError()
                ->setNextUrl(PaymentHelper::getCancelURL())
                ->withInput()
                ->setMessage(__('Payment failed!'));
        }

        $payPalPaymentService->afterMakePayment($request->input());

        return $response
            ->setNextUrl(PaymentHelper::getRedirectURL())
            ->setMessage(__('Checkout successfully!'));
    }
}
