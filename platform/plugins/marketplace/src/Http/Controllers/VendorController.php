<?php

namespace HuberwayCMS\Marketplace\Http\Controllers;

use HuberwayCMS\Marketplace\Tables\VendorTable;

class VendorController extends BaseController
{
    public function index(VendorTable $table)
    {
        $this->pageTitle(trans('plugins/marketplace::marketplace.vendors'));

        return $table->renderTable();
    }
}
