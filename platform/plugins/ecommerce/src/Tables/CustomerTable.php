<?php

namespace HuberwayCMS\Ecommerce\Tables;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Ecommerce\Enums\CustomerStatusEnum;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\EmailBulkChange;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\BulkChanges\StatusBulkChange;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\EmailColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\PhoneColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\Columns\YesNoColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class CustomerTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Customer::class)
            ->addActions([
                EditAction::make()->route('customers.edit'),
                DeleteAction::make()->route('customers.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('avatar', function (Customer $item) {
                if ($this->isExportingToCSV() || $this->isExportingToExcel()) {
                    return $item->avatar_url;
                }

                return Html::tag(
                    'img',
                    '',
                    ['src' => $item->avatar_url, 'alt' => BaseHelper::clean($item->name), 'width' => 50]
                );
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
                'email',
                'phone',
                'avatar',
                'created_at',
                'status',
                'confirmed_at',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        $columns = [
            IdColumn::make(),
            Column::make('avatar')
                ->title(trans('plugins/ecommerce::customer.avatar')),
            NameColumn::make()->route('customers.edit'),
        ];

        if (EcommerceHelper::isLoginUsingPhone()) {
            $columns[] = PhoneColumn::make();
        } else {
            $columns[] = EmailColumn::make();

            if (EcommerceHelper::isEnableEmailVerification()) {
                $columns = array_merge($columns, [
                    YesNoColumn::make('confirmed_at')
                        ->title(trans('plugins/ecommerce::customer.email_verified')),
                ]);
            }
        }

        return array_merge($columns, [
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ]);
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('customers.create'), 'customers.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('customers.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            NameBulkChange::make(),
            EmailBulkChange::make(),
            StatusBulkChange::make()->choices(CustomerStatusEnum::labels()),
            CreatedAtColumn::make(),
        ];
    }

    public function getFilters(): array
    {
        $filters = parent::getFilters();

        if (EcommerceHelper::isEnableEmailVerification()) {
            $filters['confirmed_at'] = [
                'title' => trans('plugins/ecommerce::customer.email_verified'),
                'type' => 'select',
                'choices' => [1 => trans('core/base::base.yes'), 0 => trans('core/base::base.no')],
                'validate' => 'required|in:1,0',
            ];
        }

        return $filters;
    }

    public function renderTable($data = [], $mergeData = []): View|Factory|Response
    {
        if ($this->isEmpty()) {
            return view('plugins/ecommerce::customers.intro');
        }

        return parent::renderTable($data, $mergeData);
    }

    public function getDefaultButtons(): array
    {
        return array_merge(['export'], parent::getDefaultButtons());
    }

    public function applyFilterCondition(
        Relation|Builder|QueryBuilder $query,
        string $key,
        string $operator,
        ?string $value
    ) {
        if (EcommerceHelper::isEnableEmailVerification() && $key === 'confirmed_at') {
            return $value ? $query->whereNotNull($key) : $query->whereNull($key);
        }

        return parent::applyFilterCondition($query, $key, $operator, $value);
    }
}
