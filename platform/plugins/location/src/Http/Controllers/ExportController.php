<?php

namespace HuberwayCMS\Location\Http\Controllers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Location\Exports\CsvLocationExport;
use HuberwayCMS\Location\Models\City;
use HuberwayCMS\Location\Models\Country;
use HuberwayCMS\Location\Models\State;
use Maatwebsite\Excel\Excel;

class ExportController extends BaseController
{
    public function index()
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/location::location.name'));

        $this->pageTitle(trans('plugins/location::location.export_location'));

        Assets::addScriptsDirectly(['vendor/core/plugins/location/js/export.js']);

        $countryCount = Country::query()->count();
        $stateCount = State::query()->count();
        $cityCount = City::query()->count();

        return view('plugins/location::export.index', compact('countryCount', 'stateCount', 'cityCount'));
    }

    public function export(CsvLocationExport $csvLocationExport)
    {
        BaseHelper::maximumExecutionTimeAndMemoryLimit();

        return $csvLocationExport->download('exported_location.csv', Excel::CSV, ['Content-Type' => 'text/csv']);
    }
}
