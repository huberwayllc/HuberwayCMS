<?php

namespace HuberwayCMS\Marketplace\Tables;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Ecommerce\Models\Shipment;
use HuberwayCMS\Marketplace\Tables\Traits\ForVendor;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class ShipmentTable extends TableAbstract
{
    use ForVendor;

    public function setup(): void
    {
        $this
            ->model(Shipment::class)
            ->addActions([
                EditAction::make()->route('marketplace.vendor.shipments.edit'),
                DeleteAction::make()->route('marketplace.vendor.shipments.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('order_id', function ($item) {
                return Html::link(
                    route('marketplace.vendor.orders.edit', $item->order->id),
                    $item->order->code . ' <i class="fa fa-external-link-alt"></i>',
                    ['target' => '_blank'],
                    null,
                    false
                );
            })
            ->editColumn('user_id', function ($item) {
                return BaseHelper::clean($item->order->user->name ?: $item->order->address->name);
            })
            ->editColumn('price', function ($item) {
                return format_price($item->price);
            })
            ->editColumn('cod_status', function ($item) {
                if (! (float)$item->cod_amount) {
                    return Html::tag(
                        'span',
                        trans('plugins/ecommerce::shipping.not_available'),
                        ['class' => 'label-info status-label']
                    )
                        ->toHtml();
                }

                return BaseHelper::clean($item->cod_status->toHtml());
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'order_id',
                'user_id',
                'price',
                'status',
                'cod_status',
                'created_at',
            ])
            ->whereHas('order', function ($query) {
                $query->where('store_id', auth('customer')->user()->store->id);
            })
            ->with(['order', 'order.user', 'order.address']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('order_id')
                ->title(trans('plugins/ecommerce::shipping.order_id')),
            Column::make('user_id')
                ->title(trans('plugins/ecommerce::order.customer_label'))
                ->alignStart(),
            Column::make('price')
                ->title(trans('plugins/ecommerce::shipping.shipping_amount')),
            Column::make('cod_status')
                ->title(trans('plugins/ecommerce::shipping.cod_status')),
            StatusColumn::make(),
            CreatedAtColumn::make(),
        ];
    }
}
