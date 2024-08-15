<?php

namespace HuberwayCMS\Marketplace\Tables;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\Action;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class UnverifiedVendorTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Customer::class)
            ->addActions([
                Action::make('view')
                    ->route('marketplace.unverified-vendors.view')
                    ->permission('marketplace.unverified-vendors.index')
                    ->label(__('View'))
                    ->icon('ti ti-eye'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('avatar', function ($item) {
                if ($this->request()->input('action') == 'excel' ||
                    $this->request()->input('action') == 'csv') {
                    return $item->avatar_url;
                }

                return Html::tag('img', '', ['src' => $item->avatar_url, 'alt' => BaseHelper::clean($item->name), 'width' => 50]);
            })
            ->editColumn('store_name', function ($item) {
                return BaseHelper::clean($item->store->name);
            })
            ->editColumn('store_phone', function ($item) {
                return BaseHelper::clean($item->store->phone);
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
                'name',
                'created_at',
                'is_vendor',
                'avatar',
            ])
            ->where([
                'is_vendor' => true,
                'vendor_verified_at' => null,
            ])
            ->with(['store']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('avatar')
                ->title(trans('plugins/ecommerce::customer.avatar'))
                ->width(70),
            NameColumn::make()
                ->route('marketplace.unverified-vendors.view')
                ->permission('marketplace.unverified-vendors.edit'),
            Column::make('store_name')
                ->title(trans('plugins/marketplace::unverified-vendor.forms.store_name'))
                ->alignStart()
                ->orderable(false)
                ->searchable(false),
            Column::make('store_phone')
                ->title(trans('plugins/marketplace::unverified-vendor.forms.store_phone'))
                ->alignStart()
                ->orderable(false)
                ->searchable(false),
            CreatedAtColumn::make(),
        ];
    }
}
