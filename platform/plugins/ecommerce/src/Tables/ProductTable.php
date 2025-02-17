<?php

namespace HuberwayCMS\Ecommerce\Tables;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Ecommerce\Enums\ProductTypeEnum;
use HuberwayCMS\Ecommerce\Enums\StockStatusEnum;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Brand;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\Models\ProductCategory;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\ImageColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Eloquent\Relations\Relation as EloquentRelation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class ProductTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Product::class)
            ->addActions([
                EditAction::make()->route('products.edit'),
                DeleteAction::make()->route('products.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function (Product $item) {
                $productType = null;

                if (EcommerceHelper::isEnabledSupportDigitalProducts()) {
                    $productType = Html::tag('small', ' &mdash; ' . $item->product_type->label())->toHtml();
                }

                if (! $this->hasPermission('products.edit')) {
                    return BaseHelper::clean($item->name) . $productType;
                }

                return Html::link(
                    route('products.edit', $item->getKey()),
                    BaseHelper::clean($item->name)
                ) . $productType;
            })
            ->editColumn('price', function (Product $item) {
                return $item->price_in_table;
            })
            ->editColumn('quantity', function (Product $item) {
                if (! $item->with_storehouse_management) {
                    return '&#8734;';
                }

                if ($item->variations->isEmpty()) {
                    return $item->quantity;
                }

                $withStoreHouseManagement = $item->with_storehouse_management;

                $quantity = 0;

                foreach ($item->variations as $variation) {
                    if (! $variation->product->with_storehouse_management) {
                        $withStoreHouseManagement = false;

                        break;
                    }

                    $quantity += $variation->product->quantity;
                }

                return $withStoreHouseManagement ? $quantity : '&#8734;';
            })
            ->editColumn('sku', function (Product $item) {
                return BaseHelper::clean($item->sku ?: '&mdash;');
            })
            ->editColumn('order', function (Product $item) {
                return view('plugins/ecommerce::products.partials.sort-order', compact('item'))->render();
            })
            ->editColumn('stock_status', function (Product $item) {
                return BaseHelper::clean($item->stock_status_html);
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'order',
                'created_at',
                'status',
                'sku',
                'image',
                'images',
                'price',
                'sale_price',
                'sale_type',
                'start_date',
                'end_date',
                'quantity',
                'with_storehouse_management',
                'stock_status',
                'product_type',
            ])
            ->where('is_variation', 0)
            ->with('variations.product');

        return $this->applyScopes($query);
    }

    public function htmlDrawCallbackFunction(): string|null
    {
        return parent::htmlDrawCallbackFunction() . '$(".editable").editable({mode: "inline"});';
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            ImageColumn::make(),
            Column::make('name')
                ->title(trans('plugins/ecommerce::products.name'))
                ->alignStart(),
            Column::make('price')
                ->title(trans('plugins/ecommerce::products.price'))
                ->alignStart(),
            Column::make('stock_status')
                ->title(trans('plugins/ecommerce::products.stock_status')),
            Column::make('quantity')
                ->title(trans('plugins/ecommerce::products.quantity'))
                ->alignStart(),
            Column::make('sku')
                ->title(trans('plugins/ecommerce::products.sku'))
                ->alignStart(),
            Column::make('order')
                ->title(trans('core/base::tables.order'))
                ->width(50),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function buttons(): array
    {
        $buttons = [];
        if (EcommerceHelper::isEnabledSupportDigitalProducts() && $this->hasPermission('products.create')) {
            $buttons['create'] = [
                'extend' => 'collection',
                'text' => view('core/table::partials.create')->render(),
                'class' => 'btn-primary',
                'buttons' => [
                    [
                        'className' => 'action-item',
                        'text' => ProductTypeEnum::PHYSICAL()->toIcon() . ' ' . Html::tag(
                            'span',
                            ProductTypeEnum::PHYSICAL()->label(),
                            [
                                    'data-action' => 'physical-product',
                                    'data-href' => route('products.create'),
                                    'class' => 'ms-1',
                                ]
                        )->toHtml(),
                    ],
                    [
                        'className' => 'action-item',
                        'text' => ProductTypeEnum::DIGITAL()->toIcon() . ' ' . Html::tag(
                            'span',
                            ProductTypeEnum::DIGITAL()->label(),
                            [
                                    'data-action' => 'digital-product',
                                    'data-href' => route('products.create', ['product_type' => 'digital']),
                                    'class' => 'ms-1',
                                ]
                        )->toHtml(),
                    ],
                ],
            ];
        } else {
            $buttons = $this->addCreateButton(route('products.create'), 'products.create');
        }

        if ($this->hasPermission('ecommerce.import.products.index')) {
            $buttons['import'] = [
                'link' => route('ecommerce.import.products.index'),
                'text' =>
                    BaseHelper::renderIcon('ti ti-file-import')
                    . trans(
                        'plugins/ecommerce::bulk-import.import_products'
                    ),
            ];
        }

        if ($this->hasPermission('ecommerce.export.products.index')) {
            $buttons['export'] = [
                'link' => route('ecommerce.export.products.index'),
                'text' =>
                    BaseHelper::renderIcon('ti ti-file-export')
                    . trans(
                        'plugins/ecommerce::export.products.name'
                    ),
            ];
        }

        return $buttons;
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('products.destroy'),
        ];
    }

    public function renderTable($data = [], $mergeData = []): View|Factory|Response
    {
        if ($this->isEmpty()) {
            return view('plugins/ecommerce::products.intro');
        }

        return parent::renderTable($data, $mergeData);
    }

    public function getFilters(): array
    {
        $data = parent::getFilters();

        $data['category'] = array_merge($data['category'], [
            'type' => 'select-ajax',
        ]);

        $data['brand_id'] = array_merge($data['brand_id'], [
            'type' => 'select-ajax',
        ]);

        $data['stock_status'] = [
            'title' => trans('plugins/ecommerce::products.form.stock_status'),
            'type' => 'select',
            'choices' => StockStatusEnum::labels(),
            'validate' => 'required|in:' . implode(',', StockStatusEnum::values()),
        ];

        $data['product_type'] = [
            'title' => trans('plugins/ecommerce::products.form.product_type.title'),
            'type' => 'select',
            'choices' => ProductTypeEnum::labels(),
            'validate' => 'required|in:' . implode(',', ProductTypeEnum::values()),
        ];

        return $data;
    }

    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'order' => [
                'title' => trans('core/base::tables.order'),
                'type' => 'number',
                'validate' => 'required|min:0',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
            ],
            'category' => [
                'title' => trans('plugins/ecommerce::products.category'),
                'type' => 'select-ajax',
                'validate' => 'required',
                'callback' => function (int|string|null $value = null): array {
                    $categorySelected = [];
                    if ($value && $category = ProductCategory::query()->find($value)) {
                        $categorySelected = [$category->getKey() => $category->name];
                    }

                    return [
                        'url' => route('product-categories.search'),
                        'selected' => $categorySelected,
                        'minimum-input' => 1,
                    ];
                },
            ],
            'brand_id' => [
                'title' => trans('plugins/ecommerce::products.brand'),
                'type' => 'select-ajax',
                'validate' => 'required',
                'callback' => function (int|string|null $value = null): array {
                    $brandSelected = [];
                    if ($value && $brand = Brand::query()->find($value)) {
                        $brandSelected = [$brand->getKey() => $brand->name];
                    }

                    return [
                        'url' => route('brands.search'),
                        'selected' => $brandSelected,
                        'minimum-input' => 1,
                    ];
                },
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }

    public function applyFilterCondition(
        EloquentBuilder|QueryBuilder|EloquentRelation $query,
        string $key,
        string $operator,
        string|null $value
    ): EloquentRelation|EloquentBuilder|QueryBuilder {
        switch ($key) {
            case 'created_at':
                if (! $value) {
                    break;
                }

                $value = BaseHelper::formatDate($value);

                return $query->whereDate('ec_products.' . $key, $operator, $value);
            case 'category':
                if (! $value) {
                    break;
                }

                if (! BaseHelper::isJoined($query, 'ec_product_categories')) {
                    $query = $query
                        ->join(
                            'ec_product_category_product',
                            'ec_product_category_product.product_id',
                            '=',
                            'ec_products.id'
                        )
                        ->join(
                            'ec_product_categories',
                            'ec_product_category_product.category_id',
                            '=',
                            'ec_product_categories.id'
                        )
                        ->select($query->getModel()->getTable() . '.*');
                }

                return $query->where('ec_product_category_product.category_id', $value);

            case 'brand':
                if (! $value) {
                    break;
                }

                return $query->where('ec_products.brand_id', $operator, $value);

            case 'stock_status':
                if (! $value) {
                    break;
                }

                if ($value == StockStatusEnum::ON_BACKORDER) {
                    return parent::applyFilterCondition($query, $key, $operator, $value);
                }

                if ($value == StockStatusEnum::OUT_OF_STOCK) {
                    return $query
                        ->where(function ($query) {
                            $query
                                ->where(function ($subQuery) {
                                    $subQuery
                                        ->where('with_storehouse_management', 0)
                                        ->where('stock_status', StockStatusEnum::OUT_OF_STOCK);
                                })
                                ->orWhere(function ($subQuery) {
                                    $subQuery
                                        ->where('with_storehouse_management', 1)
                                        ->where('allow_checkout_when_out_of_stock', 0)
                                        ->where('quantity', '<=', 0);
                                });
                        });
                }

                if ($value == StockStatusEnum::IN_STOCK) {
                    return $query
                        ->where(function ($query) {
                            return $query
                                ->where(function ($subQuery) {
                                    $subQuery
                                        ->where('with_storehouse_management', 0)
                                        ->where('stock_status', StockStatusEnum::IN_STOCK);
                                })
                                ->orWhere(function ($subQuery) {
                                    $subQuery
                                        ->where('with_storehouse_management', 1)
                                        ->where(function ($sub) {
                                            $sub
                                                ->where('allow_checkout_when_out_of_stock', 1)
                                                ->orWhere('quantity', '>', 0);
                                        });
                                });
                        });
                }
        }

        return parent::applyFilterCondition($query, $key, $operator, $value);
    }

    public function saveBulkChangeItem(Model|Product $item, string $inputKey, string|null $inputValue): Model|bool
    {
        if ($inputKey === 'category') {
            /**
             * @var Product $item
             */
            $item->categories()->sync([$inputValue]);

            return $item;
        }

        return parent::saveBulkChangeItem($item, $inputKey, $inputValue);
    }
}
