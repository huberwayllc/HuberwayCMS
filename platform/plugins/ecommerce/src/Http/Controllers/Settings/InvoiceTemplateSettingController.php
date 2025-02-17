<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Settings;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Http\Requests\Settings\InvoiceTemplateSettingRequest;
use HuberwayCMS\Ecommerce\Supports\InvoiceHelper;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\File;

class InvoiceTemplateSettingController extends BaseController
{
    public function edit(InvoiceHelper $invoiceHelper): View
    {
        Assets::addScriptsDirectly('vendor/core/core/setting/js/email-template.js');

        $content = $invoiceHelper->getInvoiceTemplate();
        $variables = $invoiceHelper->getVariables();

        return view('plugins/ecommerce::invoice-template.settings', compact('content', 'variables'));
    }

    public function update(InvoiceTemplateSettingRequest $request)
    {
        BaseHelper::saveFileData(storage_path('app/templates/invoice.tpl'), $request->input('content'), false);

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function reset()
    {
        File::delete(storage_path('app/templates/invoice.tpl'));

        return $this
            ->httpResponse()
            ->setMessage(trans('core/setting::setting.email.reset_success'));
    }

    public function preview(InvoiceHelper $invoiceHelper)
    {
        $invoice = $invoiceHelper->getDataForPreview();

        return $invoiceHelper->streamInvoice($invoice);
    }
}
