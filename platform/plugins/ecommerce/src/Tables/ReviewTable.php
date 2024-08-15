<?php

namespace HuberwayCMS\Ecommerce\Tables;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Ecommerce\Models\Review;
use HuberwayCMS\Ecommerce\Tables\Formatters\ReviewImagesFormatter;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\Action;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\LinkableColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class ReviewTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Review::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('reviews.create'))
            ->addActions([
                Action::make('view')
                    ->route('reviews.show')
                    ->permission('reviews.index')
                    ->label(__('View'))
                    ->icon('ti ti-eye'),
                DeleteAction::make()->route('reviews.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('product_id', function (Review $item) {
                if (! empty($item->product) && $item->product->url) {
                    return Html::link(
                        $item->product->url,
                        BaseHelper::clean($item->product_name),
                        ['target' => '_blank']
                    );
                }

                return null;
            })
            ->editColumn('customer_id', function (Review $item) {
                if (! $item->user->id) {
                    return null;
                }

                return Html::link(
                    route('customers.edit', $item->user->id),
                    BaseHelper::clean($item->user->name)
                )->toHtml();
            })
            ->editColumn('star', function (Review $item) {
                return view('plugins/ecommerce::reviews.partials.rating', ['star' => $item->star])->render();
            })
            ->formatColumn('images', ReviewImagesFormatter::class)
            ->filter(function ($query) {
                $keyword = $this->request->input('search.value');
                if ($keyword) {
                    return $query->where(function ($query) use ($keyword) {
                        return $query
                            ->whereHas('product', function ($subQuery) use ($keyword) {
                                return $subQuery->where('ec_products.name', 'LIKE', '%' . $keyword . '%');
                            })
                            ->orWhereHas('user', function ($subQuery) use ($keyword) {
                                return $subQuery->where('ec_customers.name', 'LIKE', '%' . $keyword . '%');
                            })
                            ->orWhere('comment', 'LIKE', '%' . $keyword . '%');
                    });
                }

                return $query;
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()
            ->query()
            ->select([
                'id',
                'star',
                'comment',
                'product_id',
                'customer_id',
                'status',
                'created_at',
                'images',
            ])
            ->with(['user', 'product']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('product_id')
                ->title(trans('plugins/ecommerce::review.product'))
                ->alignStart(),
            Column::make('customer_id')
                ->title(trans('plugins/ecommerce::review.user'))
                ->alignStart(),
            Column::make('star')
                ->title(trans('plugins/ecommerce::review.star')),
            LinkableColumn::make('comment')
                ->title(trans('plugins/ecommerce::review.comment'))
                ->route('reviews.show')
                ->alignStart()
                ->limit(70),
            Column::formatted('images')
                ->title(trans('plugins/ecommerce::review.images'))
                ->alignStart()
                ->width(150)
                ->orderable(false)
                ->searchable(false),
            StatusColumn::make(),
            CreatedAtColumn::make(),
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('review.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
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
            return view('plugins/ecommerce::reviews.intro');
        }

        return parent::renderTable($data, $mergeData);
    }
}
