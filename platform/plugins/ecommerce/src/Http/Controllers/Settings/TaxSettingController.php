<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Ecommerce\Forms\Settings\TaxSettingForm;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\TaxSettingRequest;
use HuberwayCMS\Ecommerce\Tables\TaxTable;
use Illuminate\Http\Request;

class TaxSettingController extends SettingController
{
    public function index(Request $request, TaxTable $taxTable)
    {
        if ($request->expectsJson()) {
            return $taxTable->renderTable();
        }

        $this->pageTitle(trans('plugins/ecommerce::setting.tax.name'));

        $form = TaxSettingForm::create();

        return view('plugins/ecommerce::settings.tax', compact('taxTable', 'form'));
    }

    public function update(TaxSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
