<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Widgets\Contracts\AdminWidget;
use HuberwayCMS\Ecommerce\Enums\OrderStatusEnum;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\Order;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\Tables\Reports\RecentOrdersTable;
use HuberwayCMS\Ecommerce\Tables\Reports\TopSellingProductsTable;
use HuberwayCMS\Ecommerce\Tables\Reports\TrendingProductsTable;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ReportController extends BaseController
{
    public function getIndex(Request $request, AdminWidget $widget)
    {
        $this->pageTitle(trans('plugins/ecommerce::reports.name'));

        Assets::addScriptsDirectly([
            'vendor/core/plugins/ecommerce/libraries/daterangepicker/daterangepicker.js',
            'vendor/core/plugins/ecommerce/js/report.js',
        ])
            ->addStylesDirectly([
                'vendor/core/plugins/ecommerce/libraries/daterangepicker/daterangepicker.css',
                'vendor/core/plugins/ecommerce/css/report.css',
            ]);

        Assets::usingVueJS();

        [$startDate, $endDate] = EcommerceHelper::getDateRangeInReport($request);

        if ($request->ajax()) {
            return $this
                ->httpResponse()->setData(view('plugins/ecommerce::reports.ajax', compact('widget'))->render());
        }

        return view(
            'plugins/ecommerce::reports.index',
            compact('startDate', 'endDate', 'widget')
        );
    }

    public function getTopSellingProducts(TopSellingProductsTable $topSellingProductsTable)
    {
        return $topSellingProductsTable->renderTable();
    }

    public function getRecentOrders(RecentOrdersTable $recentOrdersTable)
    {
        return $recentOrdersTable->renderTable();
    }

    public function getTrendingProducts(TrendingProductsTable $trendingProductsTable)
    {
        return $trendingProductsTable->renderTable();
    }

    public function getDashboardWidgetGeneral()
    {
        $startOfMonth = Carbon::now()->startOfMonth();
        $today = Carbon::now();

        $processingOrders = Order::query()
            ->where('status', OrderStatusEnum::PENDING)
            ->whereDate('created_at', '>=', $startOfMonth)
            ->whereDate('created_at', '<=', $today)
            ->count();

        $completedOrders = Order::query()
            ->where('status', OrderStatusEnum::COMPLETED)
            ->whereDate('created_at', '>=', $startOfMonth)
            ->whereDate('created_at', '<=', $today)
            ->count();

        $revenue = Order::countRevenueByDateRange($startOfMonth, $today);

        $lowStockProducts = Product::query()
            ->where('with_storehouse_management', 1)
            ->where('quantity', '<', 2)
            ->where('quantity', '>', 0)
            ->count();

        $outOfStockProducts = Product::query()
            ->where('with_storehouse_management', 1)
            ->where('quantity', '<', 1)
            ->count();

        return $this
            ->httpResponse()
            ->setData(
                view(
                    'plugins/ecommerce::reports.widgets.general',
                    compact(
                        'processingOrders',
                        'revenue',
                        'completedOrders',
                        'outOfStockProducts',
                        'lowStockProducts'
                    )
                )->render()
            );
    }
}
