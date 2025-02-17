<?php

namespace HuberwayCMS\Ecommerce\Tables;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Ecommerce\Enums\ShippingStatusEnum;
use HuberwayCMS\Ecommerce\Models\Shipment;
use HuberwayCMS\Ecommerce\Tables\Formatters\PriceFormatter;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
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
    public function setup(): void
    {
        $this
            ->model(Shipment::class)
            ->addActions([
                EditAction::make()->route('ecommerce.shipments.edit'),
                DeleteAction::make()->route('ecommerce.shipments.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('order_id', function (Shipment $item) {
                if (! $this->hasPermission('orders.edit')) {
                    return $item->order->code;
                }

                return Html::link(
                    route('orders.edit', $item->order->id),
                    $item->order->code . ' <i class="fa fa-external-link-alt"></i>',
                    ['target' => '_blank'],
                    null,
                    false
                );
            })
            ->editColumn('user_id', function (Shipment $item) {
                return BaseHelper::clean($item->order->user->name ?: $item->order->address->name);
            })
            ->formatColumn('price', PriceFormatter::class)
            ->editColumn('cod_status', function (Shipment $item) {
                if (! (float)$item->cod_amount) {
                    return Html::tag(
                        'span',
                        trans('plugins/ecommerce::shipping.not_available'),
                        ['class' => 'label-info status-label']
                    )
                        ->toHtml();
                }

                return BaseHelper::clean($item->cod_status->toHtml());
            })
            ->filter(function ($query) {
                $keyword = $this->request->input('search.value');
                if ($keyword) {
                    return $query
                        ->whereHas('order.address', function ($subQuery) use ($keyword) {
                            return $subQuery->where('ec_order_addresses.name', 'LIKE', '%' . $keyword . '%');
                        });
                }

                return $query;
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
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('order_id')->title(trans('plugins/ecommerce::shipping.order_id')),
            Column::make('user_id')->title(trans('plugins/ecommerce::order.customer_label'))->alignStart(),
            Column::formatted('price')
                ->title(trans('plugins/ecommerce::shipping.shipping_amount')),
            StatusColumn::make(),
            Column::make('cod_status')->title(trans('plugins/ecommerce::shipping.cod_status')),
            CreatedAtColumn::make(),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => ShippingStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', ShippingStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('ecommerce.shipments.destroy'),
        ];
    }
}
