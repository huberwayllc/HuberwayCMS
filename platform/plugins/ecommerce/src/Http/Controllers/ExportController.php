<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Supports\Breadcrumb;
use HuberwayCMS\Ecommerce\Exports\CsvProductExport;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\Models\ProductVariation;
use Maatwebsite\Excel\Excel;

class ExportController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/ecommerce::products.name'), route('products.index'))
            ->add(trans('plugins/ecommerce::export.products.name'), route('ecommerce.export.products.index'));
    }

    public function products()
    {
        $this->pageTitle(trans('plugins/ecommerce::export.products.name'));

        Assets::addScriptsDirectly(['vendor/core/plugins/ecommerce/js/export.js']);

        $totalProduct = Product::query()->where(['is_variation' => 0])->count();
        $totalVariation = ProductVariation::query()
            ->whereHas('product')
            ->whereHas('configurableProduct', function ($query) {
                $query->where('is_variation', 0);
            })
            ->count();

        return view('plugins/ecommerce::export.products', compact('totalProduct', 'totalVariation'));
    }

    public function exportProducts()
    {
        BaseHelper::maximumExecutionTimeAndMemoryLimit();

        return (new CsvProductExport())->download('export_products.csv', Excel::CSV, ['Content-Type' => 'text/csv']);
    }
}
