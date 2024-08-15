<?php

namespace HuberwayCMS\Ecommerce\Facades;

use HuberwayCMS\Ecommerce\Supports\InvoiceHelper as BaseInvoiceHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static mixed store(\HuberwayCMS\Ecommerce\Models\Order $order)
 * @method static \Barryvdh\DomPDF\PDF|\Dompdf\Dompdf makeInvoicePDF(\HuberwayCMS\Ecommerce\Models\Invoice $invoice)
 * @method static string generateInvoice(\HuberwayCMS\Ecommerce\Models\Invoice $invoice)
 * @method static \Illuminate\Http\Response downloadInvoice(\HuberwayCMS\Ecommerce\Models\Invoice $invoice)
 * @method static \Illuminate\Http\Response streamInvoice(\HuberwayCMS\Ecommerce\Models\Invoice $invoice)
 * @method static string getInvoiceTemplate()
 * @method static \HuberwayCMS\Ecommerce\Models\Invoice getDataForPreview()
 * @method static array getVariables()
 * @method static string|null getCompanyCountry()
 * @method static string|null getCompanyState()
 * @method static string|null getCompanyCity()
 * @method static string|null getCompanyZipCode()
 *
 * @see \HuberwayCMS\Ecommerce\Supports\InvoiceHelper
 */
class InvoiceHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseInvoiceHelper::class;
    }
}
