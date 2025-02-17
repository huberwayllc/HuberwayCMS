<?php

namespace HuberwayCMS\Marketplace\Http\Controllers;

use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Marketplace\Enums\RevenueTypeEnum;
use HuberwayCMS\Marketplace\Http\Requests\StoreRevenueRequest;
use HuberwayCMS\Marketplace\Models\Revenue;
use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Marketplace\Tables\StoreRevenueTable;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Throwable;

class StoreRevenueController extends BaseController
{
    public function index(StoreRevenueTable $table)
    {
        return $table->renderTable();
    }

    public function view(int|string $id, StoreRevenueTable $table)
    {
        $store = Store::query()->findOrFail($id);
        $customer = $store->customer;

        if (! $customer->id) {
            abort(404);
        }

        Assets::addScriptsDirectly(['vendor/core/plugins/marketplace/js/store-revenue.js']);
        $table->setAjaxUrl(route('marketplace.store.revenue.index', $customer->id));
        $this->pageTitle(trans('plugins/marketplace::revenue.view_store', ['store' => $store->name]));

        return view('plugins/marketplace::stores.index', compact('table', 'store', 'customer'))->render();
    }

    public function store(int|string $id, StoreRevenueRequest $request)
    {
        $store = Store::query()->findOrFail($id);

        $customer = $store->customer;

        if (! $customer->id) {
            abort(404);
        }

        $vendorInfo = $customer->vendorInfo;

        $amount = $request->input('amount');
        $data = [
            'fee' => 0,
            'currency' => get_application_currency()->title,
            'current_balance' => $customer->balance,
            'customer_id' => $customer->getKey(),
            'order_id' => 0,
            'user_id' => Auth::id(),
            'type' => $request->input('type'),
            'description' => $request->input('description'),
            'amount' => $amount,
            'sub_amount' => $amount,
        ];

        if ($request->input('type') == RevenueTypeEnum::ADD_AMOUNT) {
            $vendorInfo->total_revenue += $amount;
            $vendorInfo->balance += $amount;
        } else {
            $vendorInfo->total_revenue -= $amount;
            $vendorInfo->balance -= $amount;
        }

        try {
            DB::beginTransaction();

            Revenue::query()->create($data);

            $vendorInfo->save();

            DB::commit();
        } catch (Throwable | Exception $th) {
            DB::rollBack();

            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($th->getMessage());
        }

        event(new UpdatedContentEvent(STORE_MODULE_SCREEN_NAME, $request, $store));

        return $this
            ->httpResponse()
            ->setData(['balance' => format_price($customer->balance)])
            ->setPreviousUrl(route('marketplace.store.index'))
            ->withUpdatedSuccessMessage();
    }
}
