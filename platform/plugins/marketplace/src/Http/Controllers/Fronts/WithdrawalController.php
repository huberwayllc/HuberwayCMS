<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Fronts;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Marketplace\Enums\WithdrawalStatusEnum;
use HuberwayCMS\Marketplace\Events\WithdrawalRequested;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Marketplace\Forms\VendorWithdrawalForm;
use HuberwayCMS\Marketplace\Http\Requests\Fronts\VendorEditWithdrawalRequest;
use HuberwayCMS\Marketplace\Http\Requests\Fronts\VendorWithdrawalRequest;
use HuberwayCMS\Marketplace\Models\Withdrawal;
use HuberwayCMS\Marketplace\Tables\VendorWithdrawalTable;
use Exception;
use Illuminate\Support\Facades\DB;
use Throwable;

class WithdrawalController extends BaseController
{
    public function index(VendorWithdrawalTable $table)
    {
        $this->pageTitle(__('Withdrawals'));

        return $table->renderTable();
    }

    public function create()
    {
        $user = auth('customer')->user();
        $fee = MarketplaceHelper::getSetting('fee_withdrawal', 0);

        if ($user->balance <= $fee || ! $user->bank_info) {
            return $this
                ->httpResponse()
                ->setError()
                ->setNextUrl(route('marketplace.vendor.withdrawals.index'))
                ->setMessage(__('Insufficient balance or no bank information'));
        }

        $this->pageTitle(__('Withdrawal request'));

        return VendorWithdrawalForm::create()->renderForm();
    }

    public function store(VendorWithdrawalRequest $request)
    {
        $fee = MarketplaceHelper::getSetting('fee_withdrawal', 0);
        $vendor = auth('customer')->user();
        $vendorInfo = $vendor->vendorInfo;

        if ($request->input('amount') < MarketplaceHelper::getMinimumWithdrawalAmount()) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(__('The minimum withdrawal amount is :amount', [
                    'amount' => format_price(MarketplaceHelper::getMinimumWithdrawalAmount()),
                ]));
        }

        try {
            DB::beginTransaction();

            $withdrawal = Withdrawal::query()->create([
                'fee' => $fee,
                'amount' => $request->input('amount'),
                'customer_id' => $vendor->getKey(),
                'currency' => get_application_currency()->title,
                'bank_info' => $vendorInfo->bank_info,
                'description' => $request->input('description'),
                'current_balance' => $vendorInfo->balance,
                'payment_channel' => $vendorInfo->payout_payment_method,
            ]);

            $vendorInfo->balance -= $request->input('amount') + $fee;
            $vendorInfo->save();

            event(new WithdrawalRequested($vendor, $withdrawal));

            DB::commit();
        } catch (Throwable | Exception $th) {
            DB::rollBack();

            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($th->getMessage());
        }

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('marketplace.vendor.withdrawals.index'))
            ->withCreatedSuccessMessage();
    }

    public function edit(int|string $id)
    {
        $withdrawal = Withdrawal::query()
            ->where([
                'id' => $id,
                'customer_id' => auth('customer')->id(),
                'status' => WithdrawalStatusEnum::PENDING,
            ])
            ->firstOrFail();

        $this->pageTitle(__('Update withdrawal request #' . $id));

        return VendorWithdrawalForm::createFromModel($withdrawal)->renderForm();
    }

    public function update(int|string $id, VendorEditWithdrawalRequest $request)
    {
        $withdrawal = Withdrawal::query()
            ->where([
                'id' => $id,
                'customer_id' => auth('customer')->id(),
                'status' => WithdrawalStatusEnum::PENDING,
            ])
            ->firstOrFail();

        $status = WithdrawalStatusEnum::PENDING;
        if ($request->input('cancel')) {
            $status = WithdrawalStatusEnum::CANCELED;
            $this
                ->httpResponse()
                ->setNextUrl(route('marketplace.vendor.withdrawals.show', $withdrawal->id));
        }

        $withdrawal->fill([
            'status' => $status,
            'description' => $request->input('description'),
        ]);

        $withdrawal->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('marketplace.vendor.withdrawals.index'))
            ->withUpdatedSuccessMessage();
    }

    public function show(int|string $id)
    {
        $withdrawal = Withdrawal::query()
            ->where('id', $id)
            ->where('customer_id', auth('customer')->id())
            ->where('status', '!=', WithdrawalStatusEnum::PENDING)
            ->firstOrFail();

        $this->pageTitle(__('View withdrawal request #' . $id));

        return VendorWithdrawalForm::createFromModel($withdrawal)->renderForm();
    }
}
