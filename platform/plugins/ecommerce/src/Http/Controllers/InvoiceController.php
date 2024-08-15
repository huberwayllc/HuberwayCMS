<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Events\BeforeEditContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Supports\Breadcrumb;
use HuberwayCMS\Ecommerce\Facades\InvoiceHelper;
use HuberwayCMS\Ecommerce\Models\Invoice;
use HuberwayCMS\Ecommerce\Models\Order;
use HuberwayCMS\Ecommerce\Tables\InvoiceTable;
use Exception;
use Illuminate\Http\Request;

class InvoiceController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/ecommerce::invoice.name'), route('ecommerce.invoice.index'));
    }

    public function index(InvoiceTable $table)
    {
        $this->pageTitle(trans('plugins/ecommerce::invoice.name'));

        return $table->renderTable();
    }

    public function edit(Invoice $invoice, Request $request)
    {
        event(new BeforeEditContentEvent($request, $invoice));

        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $invoice->code]));

        return view('plugins/ecommerce::invoices.edit', compact('invoice'));
    }

    public function destroy(Invoice $invoice, Request $request)
    {
        try {
            $invoice->delete();

            event(new DeletedContentEvent(INVOICE_MODULE_SCREEN_NAME, $request, $invoice));

            return $this
                ->httpResponse()
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function getGenerateInvoice(Invoice $invoice, Request $request)
    {
        if ($request->input('type') === 'print') {
            return InvoiceHelper::streamInvoice($invoice);
        }

        return InvoiceHelper::downloadInvoice($invoice);
    }

    public function generateInvoices()
    {
        $orders = Order::query()
            ->where('is_finished', true)
            ->doesntHave('invoice')
            ->get();

        foreach ($orders as $order) {
            InvoiceHelper::store($order);
        }

        $message = trans('plugins/ecommerce::invoice.generate_success_message', ['count' => $orders->count()]);

        if ($orders->isEmpty()) {
            $message = trans('plugins/ecommerce::invoice.all_invoices_have_already_generated');
        }

        return $this
            ->httpResponse()
            ->setNextUrl(route('ecommerce.invoice.index'))
            ->setMessage($message);
    }
}
