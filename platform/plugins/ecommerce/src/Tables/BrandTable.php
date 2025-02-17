<?php

namespace HuberwayCMS\Ecommerce\Tables;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Ecommerce\Models\Brand;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\ImageColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\Columns\YesNoColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Symfony\Component\HttpFoundation\Response;

class BrandTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Brand::class)
            ->addActions([
                EditAction::make()->route('brands.edit'),
                DeleteAction::make()->route('brands.destroy'),
            ]);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'created_at',
                'status',
                'is_featured',
                'logo',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            ImageColumn::make('logo')
                ->title(trans('plugins/ecommerce::brands.logo')),
            NameColumn::make()->route('brands.edit'),
            YesNoColumn::make('is_featured')
                ->title(trans('core/base::tables.is_featured'))
                ->alignStart(),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('brands.create'), 'brands.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('brands.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }

    public function renderTable($data = [], $mergeData = []): View|Factory|Response
    {
        if ($this->isEmpty()) {
            return view('plugins/ecommerce::brands.intro');
        }

        return parent::renderTable($data, $mergeData);
    }
}
