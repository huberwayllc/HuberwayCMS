<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Fronts;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Enums\ShippingCodStatusEnum;
use HuberwayCMS\Ecommerce\Enums\ShippingStatusEnum;
use HuberwayCMS\Ecommerce\Events\ShippingStatusChanged;
use HuberwayCMS\Ecommerce\Facades\OrderHelper;
use HuberwayCMS\Ecommerce\Http\Requests\ShipmentRequest;
use HuberwayCMS\Ecommerce\Http\Requests\UpdateShipmentCodStatusRequest;
use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Ecommerce\Models\OrderHistory;
use HuberwayCMS\Ecommerce\Models\Shipment;
use HuberwayCMS\Ecommerce\Models\ShipmentHistory;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Marketplace\Http\Requests\Fronts\UpdateShippingStatusRequest;
use HuberwayCMS\Marketplace\Tables\ShipmentTable;
use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Model;

class ShipmentController extends BaseController
{
    public function index(ShipmentTable $dataTable)
    {
        $this->pageTitle(trans('plugins/ecommerce::shipping.shipments'));

        return $dataTable->renderTable();
    }

    public function edit(int|string $id)
    {
        Assets::addStylesDirectly('vendor/core/plugins/ecommerce/css/ecommerce.css')
            ->addScriptsDirectly('vendor/core/plugins/ecommerce/js/shipment.js');

        $shipment = $this->findOrFail($id);
        $shipment->load([
            'histories' => function ($query) {
                $query->latest();
            },
            'histories.order',
            'histories.user',
        ]);

        $this->pageTitle(trans('plugins/ecommerce::shipping.edit_shipping', ['code' => get_shipment_code($id)]));

        return MarketplaceHelper::view('vendor-dashboard.shipments.edit', compact('shipment'));
    }

    public function postUpdateStatus(int|string $id, UpdateShippingStatusRequest $request)
    {
        $status = $request->input('status');

        if (
            ! MarketplaceHelper::allowVendorManageShipping() &&
            ! in_array($status, [
                ShippingStatusEnum::ARRANGE_SHIPMENT,
                ShippingStatusEnum::READY_TO_BE_SHIPPED_OUT,
            ])
        ) {
            abort(404);
        }

        $shipment = $this->findOrFail($id);
        $previousShipment = $shipment->toArray();
        $shipment->status = $status;
        $shipment->save();

        ShipmentHistory::query()->create([
            'action' => 'update_status',
            'description' => trans('plugins/ecommerce::shipping.changed_shipping_status', [
                'status' => $shipment->status->label(),
            ]),
            'shipment_id' => $id,
            'order_id' => $shipment->order_id,
            'user_id' => auth('customer')->id(),
            'user_type' => Customer::class,
        ]);

        switch ($shipment->status) {
            case ShippingStatusEnum::DELIVERED:
                $shipment->date_shipped = Carbon::now();
                $shipment->save();

                OrderHelper::shippingStatusDelivered($shipment, $request);

                break;

            case ShippingStatusEnum::CANCELED:
                OrderHistory::query()->create([
                    'action' => 'cancel_shipment',
                    'description' => trans('plugins/ecommerce::shipping.shipping_canceled_by'),
                    'order_id' => $shipment->order_id,
                    'user_id' => 0,
                ]);

                break;
        }

        event(new ShippingStatusChanged($shipment, $previousShipment));

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::shipping.update_shipping_status_success'));
    }

    public function postUpdateCodStatus(int|string $id, UpdateShipmentCodStatusRequest $request)
    {
        $shipment = $this->findOrFail($id);
        $shipment->cod_status = $request->input('status');
        $shipment->save();

        if ($shipment->cod_status == ShippingCodStatusEnum::COMPLETED) {
            OrderHelper::confirmPayment($shipment->order);
        }

        ShipmentHistory::query()->create([
            'action' => 'update_cod_status',
            'description' => trans('plugins/ecommerce::shipping.updated_cod_status_by', [
                'status' => $shipment->cod_status->label(),
            ]),
            'shipment_id' => $id,
            'order_id' => $shipment->order_id,
            'user_id' => auth('customer')->id(),
            'user_type' => Customer::class,
        ]);

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::shipping.update_cod_status_success'));
    }

    public function update(int|string $id, ShipmentRequest $request)
    {
        $shipment = $this->findOrFail($id);

        $shipment->fill($request->validated());
        $shipment->save();

        return $this->httpResponse()
            ->setPreviousUrl(route('marketplace.vendor.shipments.index'))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(int|string $id)
    {
        $shipment = $this->findOrFail($id);

        try {
            $shipment->delete();

            return $this
                ->httpResponse()
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $this->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    protected function findOrFail(int|string $id): Shipment|Model|null
    {
        return Shipment::query()
            ->where('id', $id)
            ->whereHas('order', function ($query) {
                $query->where('store_id', auth('customer')->user()->store->id);
            })
            ->firstOrFail();
    }
}
