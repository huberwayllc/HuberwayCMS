<?php

namespace HuberwayCMS\Marketplace\Http\Controllers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Widgets\Contracts\AdminWidget;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Marketplace\Tables\StoreRevenueTable;
use Illuminate\Http\Request;

class ReportController extends BaseController
{
    public function index(
        Request $request,
        AdminWidget $widget
    ) {
        $this->pageTitle(trans('plugins/marketplace::marketplace.reports.name'));

        Assets::usingVueJS()
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/daterangepicker/daterangepicker.js',
                'vendor/core/plugins/ecommerce/js/report.js',
            ])
            ->addStylesDirectly([
                'vendor/core/plugins/ecommerce/libraries/daterangepicker/daterangepicker.css',
                'vendor/core/plugins/ecommerce/css/report.css',
            ])
            ->addScripts(['moment', 'apexchart'])
            ->addStyles(['apexchart']);

        [$startDate, $endDate] = EcommerceHelper::getDateRangeInReport($request);

        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData($widget->render(MARKETPLACE_MODULE_SCREEN_NAME));
        }

        return view(
            'plugins/marketplace::reports.index',
            compact('startDate', 'endDate', 'widget')
        );
    }

    public function getStoreRevenues(StoreRevenueTable $storeRevenueTable)
    {
        return $storeRevenueTable->renderTable();
    }
}
