<?php

namespace HuberwayCMS\Ecommerce\Tables\Reports;

use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper as EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\Models\ProductView;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class TrendingProductsTable extends TableAbstract
{
    public function setup(): void
    {
        $this->model(Product::class);

        $this->view = $this->simpleTableView();
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function (Product $product) {
                return Html::link($product->url, $product->name, ['target' => '_blank']);
            })
            ->editColumn('views', function (Product $product) {
                return number_format((float)$product->views_count);
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        [$startDate, $endDate] = EcommerceHelper::getDateRangeInReport(request());

        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'views_count' => ProductView::query()
                    ->selectRaw('SUM(views) as views_count')
                    ->whereColumn('product_id', 'ec_products.id')
                    ->whereDate('date', '>=', $startDate)
                    ->whereDate('date', '<=', $endDate)
                    ->groupBy('product_id'),
            ])
            ->wherePublished()
            ->where('is_variation', false)
            ->orderByDesc('views_count')
            ->limit(5);

        return $this->applyScopes($query);
    }

    public function getColumns(): array
    {
        return $this->columns();
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('name')
                ->title(trans('plugins/ecommerce::reports.product_name'))
                ->alignStart()
                ->orderable(false)
                ->searchable(false),
            Column::make('views')
                ->title(trans('plugins/ecommerce::reports.views'))
                ->alignEnd()
                ->orderable(false)
                ->searchable(false),
        ];
    }

    public function isSimpleTable(): bool
    {
        return true;
    }
}
