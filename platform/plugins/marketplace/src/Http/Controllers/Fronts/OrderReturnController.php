<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Fronts;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Enums\OrderReturnStatusEnum;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Facades\OrderReturnHelper;
use HuberwayCMS\Ecommerce\Http\Requests\UpdateOrderReturnRequest;
use HuberwayCMS\Ecommerce\Models\OrderReturn;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Marketplace\Tables\OrderReturnTable;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class OrderReturnController extends BaseController
{
    public function __construct()
    {
        if (! EcommerceHelper::isOrderReturnEnabled()) {
            abort(404);
        }
    }

    public function index(OrderReturnTable $orderReturnTable)
    {
        $this->pageTitle(trans('plugins/ecommerce::order.order_return'));

        return $orderReturnTable->renderTable();
    }

    protected function getStore()
    {
        return auth('customer')->user()->store;
    }

    public function edit(int|string $id)
    {
        $returnRequest = $this->findOrFail($id);

        $returnRequest->load(['items', 'customer', 'order']);

        Assets::addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/jquery.textarea_autosize.js',
                'vendor/core/plugins/ecommerce/js/order.js',
            ])
            ->addScripts(['input-mask']);

        if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            Assets::addScriptsDirectly('vendor/core/plugins/location/js/location.js');
        }

        $this->pageTitle(trans('plugins/ecommerce::order.edit_order_return', ['code' => get_order_code($id)]));

        $defaultStore = get_primary_store_locator();

        return MarketplaceHelper::view('vendor-dashboard.order-returns.edit', compact('returnRequest', 'defaultStore'));
    }

    public function update(int|string $id, UpdateOrderReturnRequest $request)
    {
        $returnRequest = $this->findOrFail($id);

        $returnRequest->load(['items', 'customer', 'order']);

        $data['return_status'] = $request->input('return_status');

        if ($returnRequest->return_status == $data['return_status'] ||
            $returnRequest->return_status == OrderReturnStatusEnum::CANCELED ||
            $returnRequest->return_status == OrderReturnStatusEnum::COMPLETED) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(trans('plugins/ecommerce::order.notices.update_return_order_status_error'));
        }

        [$status, $returnRequest] = OrderReturnHelper::updateReturnOrder($returnRequest, $data);

        if (! $status) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage(trans('plugins/ecommerce::order.notices.update_return_order_status_error'));
        }

        return $this
            ->httpResponse()
            ->setNextUrl(route('order_returns.edit', $returnRequest->id))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(int|string $id, Request $request)
    {
        $orderReturn = $this->findOrFail($id);

        try {
            $orderReturn->delete();
            event(new DeletedContentEvent(ORDER_RETURN_MODULE_SCREEN_NAME, $request, $orderReturn));

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

    protected function findOrFail(int|string $id): OrderReturn|Model|null
    {
        return OrderReturn::query()
            ->where('id', $id)
            ->where('store_id', $this->getStore()->id)
            ->firstOrFail();
    }
}
