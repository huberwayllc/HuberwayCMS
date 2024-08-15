<?php

namespace HuberwayCMS\Payment\Http\Controllers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\PageTitle;
use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Payment\Enums\PaymentStatusEnum;
use HuberwayCMS\Payment\Forms\BankTransferPaymentMethodForm;
use HuberwayCMS\Payment\Forms\CODPaymentMethodForm;
use HuberwayCMS\Payment\Forms\Settings\PaymentMethodSettingForm;
use HuberwayCMS\Payment\Http\Requests\PaymentMethodRequest;
use HuberwayCMS\Payment\Http\Requests\Settings\PaymentMethodSettingRequest;
use HuberwayCMS\Payment\Http\Requests\UpdatePaymentRequest;
use HuberwayCMS\Payment\Models\Payment;
use HuberwayCMS\Payment\Repositories\Interfaces\PaymentInterface;
use HuberwayCMS\Payment\Tables\PaymentTable;
use HuberwayCMS\Setting\Http\Controllers\SettingController;
use HuberwayCMS\Setting\Supports\SettingStore;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class PaymentController extends SettingController
{
    public function __construct(protected PaymentInterface $paymentRepository)
    {
    }

    public function index(PaymentTable $table)
    {
        PageTitle::setTitle(trans('plugins/payment::payment.name'));

        return $table->renderTable();
    }

    public function destroy(Payment $payment)
    {
        return DeleteResourceAction::make($payment);
    }

    public function show(Payment $payment)
    {
        PageTitle::setTitle(trans('plugins/payment::payment.view_transaction', ['charge_id' => $payment->charge_id]));

        $detail = apply_filters(PAYMENT_FILTER_PAYMENT_INFO_DETAIL, null, $payment);

        $paymentStatuses = PaymentStatusEnum::labels();

        if ($payment->status != PaymentStatusEnum::PENDING) {
            Arr::forget($paymentStatuses, PaymentStatusEnum::PENDING);
        }

        Assets::addScriptsDirectly('vendor/core/plugins/payment/js/payment-detail.js');

        return view('plugins/payment::show', compact('payment', 'detail', 'paymentStatuses'));
    }

    public function methods()
    {
        PageTitle::setTitle(trans('plugins/payment::payment.payment_methods'));

        Assets::addScriptsDirectly('vendor/core/plugins/payment/js/payment-methods.js');

        $form = PaymentMethodSettingForm::create()->renderForm();
        $codForm = CODPaymentMethodForm::create()->renderForm();
        $bankTransferForm = BankTransferPaymentMethodForm::create()->renderForm();

        return view('plugins/payment::settings.index', compact('form', 'codForm', 'bankTransferForm'));
    }

    public function updateSettings(PaymentMethodSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }

    public function updateMethods(PaymentMethodRequest $request, SettingStore $settingStore)
    {
        $type = $request->input('type');
        $data = $request->except(['_token', 'type']);

        foreach ($data as $settingKey => $settingValue) {
            $key = apply_filters('payment_setting_key', $settingKey);
            $settingStore->set($key, $settingValue);
        }

        $settingStore
            ->set('payment_' . $type . '_status', 1)
            ->save();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/payment::payment.saved_payment_method_success'));
    }

    public function updateMethodStatus(Request $request, SettingStore $settingStore)
    {
        $settingStore
            ->set('payment_' . $request->input('type') . '_status', 0)
            ->save();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/payment::payment.turn_off_success'));
    }

    public function update(Payment $payment, UpdatePaymentRequest $request)
    {
        $this->paymentRepository->update(['id' => $payment->getKey()], [
            'status' => $request->input('status'),
        ]);

        do_action(ACTION_AFTER_UPDATE_PAYMENT, $request, $payment);

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('payment.show', $payment->getKey()))
            ->withUpdatedSuccessMessage();
    }

    public function getRefundDetail(int|string $id, int|string $refundId)
    {
        $data = [];
        $payment = Payment::query()->findOrFail($id);

        $data = apply_filters(PAYMENT_FILTER_GET_REFUND_DETAIL, $data, $payment, $refundId);

        if (! Arr::get($data, 'error') && Arr::get($data, 'data', [])) {
            $metadata = $payment->metadata;
            $refunds = Arr::get($metadata, 'refunds', []);
            if ($refunds) {
                foreach ($refunds as $key => $refund) {
                    if (Arr::get($refund, '_refund_id') == $refundId) {
                        $refunds[$key] = array_merge($refunds[$key], (array) Arr::get($data, 'data'));
                    }
                }

                Arr::set($metadata, 'refunds', $refunds);
                $payment->metadata = $metadata;
                $payment->save();
            }
        }

        $view = Arr::get($data, 'view');

        $response = $this->httpResponse();

        if ($view) {
            $response->setData($view);
        }

        return $response
            ->setError((bool) Arr::get($data, 'error'))
            ->setMessage(Arr::get($data, 'message', ''));
    }
}
