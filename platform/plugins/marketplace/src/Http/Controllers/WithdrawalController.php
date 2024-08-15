<?php

namespace HuberwayCMS\Marketplace\Http\Controllers;

use HuberwayCMS\Base\Events\BeforeEditContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Base\Supports\Breadcrumb;
use HuberwayCMS\Marketplace\Enums\WithdrawalStatusEnum;
use HuberwayCMS\Marketplace\Forms\WithdrawalForm;
use HuberwayCMS\Marketplace\Http\Requests\WithdrawalRequest;
use HuberwayCMS\Marketplace\Models\Withdrawal;
use HuberwayCMS\Marketplace\Tables\WithdrawalTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WithdrawalController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/marketplace::withdrawal.name'), route('marketplace.withdrawal.index'));
    }

    public function index(WithdrawalTable $table)
    {
        $this->pageTitle(trans('plugins/marketplace::withdrawal.name'));

        return $table->renderTable();
    }

    public function edit(int|string $id, Request $request)
    {
        $withdrawal = Withdrawal::query()->findOrFail($id);

        event(new BeforeEditContentEvent($request, $withdrawal));

        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $withdrawal->customer->name]));

        return WithdrawalForm::createFromModel($withdrawal)->renderForm();
    }

    public function update(int|string $id, WithdrawalRequest $request)
    {
        $withdrawal = Withdrawal::query()->findOrFail($id);

        $data = [
            'images' => array_filter((array)$request->input('images', [])),
            'user_id' => Auth::id(),
            'description' => $request->input('description'),
            'payment_channel' => $request->input('payment_channel'),
            'transaction_id' => $request->input('transaction_id'),
        ];

        if ($withdrawal->canEditStatus()) {
            $data['status'] = $request->input('status');

            if ($withdrawal->status == WithdrawalStatusEnum::PROCESSING &&
                $data['status'] == WithdrawalStatusEnum::COMPLETED
            ) {
                $store = $withdrawal->customer->store;

                EmailHandler::setModule(MARKETPLACE_MODULE_SCREEN_NAME)
                    ->setVariableValues([
                        'store_name' => $store->name,
                        'withdrawal_amount' => format_price($withdrawal->amount),
                    ])
                    ->sendUsingTemplate('withdrawal-approved', $store->email);
            }
        }

        $withdrawal->fill($data);
        $withdrawal->save();

        event(new UpdatedContentEvent(WITHDRAWAL_MODULE_SCREEN_NAME, $request, $withdrawal));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('marketplace.withdrawal.index'))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(int|string $id, Request $request)
    {
        try {
            $withdrawal = Withdrawal::query()->findOrFail($id);

            $withdrawal->delete();

            event(new DeletedContentEvent(WITHDRAWAL_MODULE_SCREEN_NAME, $request, $withdrawal));

            return $this
                ->httpResponse()
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }
}
