<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Fronts;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Marketplace\Tables\ReviewTable;

class ReviewController extends BaseController
{
    public function index(ReviewTable $table)
    {
        $this->pageTitle(__('Reviews'));

        Assets::addStylesDirectly('vendor/core/plugins/ecommerce/css/review.css');

        return $table->renderTable();
    }
}
