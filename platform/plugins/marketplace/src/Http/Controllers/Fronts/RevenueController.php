<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Fronts;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Marketplace\Enums\RevenueTypeEnum;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Marketplace\Models\Revenue;
use HuberwayCMS\Marketplace\Tables\StoreRevenueTable;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class RevenueController extends BaseController
{
    public function index(StoreRevenueTable $table)
    {
        $this->pageTitle(__('Revenues'));

        $table
            ->setCustomerId(auth('customer')->id())
            ->setType(TableAbstract::TABLE_TYPE_ADVANCED)
            ->setView('core/table::table');

        return $table->render(MarketplaceHelper::viewPath('vendor-dashboard.table.base'));
    }

    public function getMonthChart(Request $request)
    {
        [$startDate, $endDate] = EcommerceHelper::getDateRangeInReport($request);

        $customerId = auth('customer')->id();

        $revenues = Revenue::query()
            ->selectRaw(
                'SUM(CASE WHEN type IS NULL OR type = ? THEN amount WHEN type = ? THEN amount * -1 ELSE 0 END) as amount,
                DATE(created_at) as date,
                currency',
                [RevenueTypeEnum::ADD_AMOUNT, RevenueTypeEnum::SUBTRACT_AMOUNT]
            )
            ->where('customer_id', $customerId)
            ->whereDate('created_at', '>=', $startDate)
            ->whereDate('created_at', '<=', $endDate)
            ->groupBy('date', 'currency')
            ->with(['currencyRelation'])
            ->get();

        $series = [];
        $dates = [];
        $revenuesGrouped = $revenues->groupBy('currency');
        $earningSales = collect();
        $period = CarbonPeriod::create($startDate, $endDate);

        $colors = ['#0064fa', '#80bc00'];

        foreach ($revenuesGrouped as $key => $revenues) {
            $data = [
                'name' => $key,
                'data' => collect(),
            ];

            foreach ($period as $date) {
                $value = $revenues
                    ->where('date', $date->format('Y-m-d'))
                    ->sum('amount');
                $data['data'][] = $value;
            }

            $currency = null;
            if ($first = $revenues->first()) {
                $currency = $first->currencyRelation;
            }

            $amount = $currency && $currency->id ? format_price(
                $data['data']->sum(),
                $currency
            ) : human_price_text($data['data']->sum(), null, $key);
            $earningSales[] = [
                'text' => __('Items Earning Sales: :amount', compact('amount')),
                'color' => Arr::get($colors, $earningSales->count(), Arr::first($colors)),
            ];
            $series[] = $data;
        }

        foreach ($period as $date) {
            $dates[] = $date->format('Y-m-d');
        }

        $colors = $earningSales->pluck('color');

        return $this
            ->httpResponse()
            ->setData(compact('dates', 'series', 'earningSales', 'colors'));
    }
}
