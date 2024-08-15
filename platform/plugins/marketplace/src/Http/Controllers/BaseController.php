<?php

namespace HuberwayCMS\Marketplace\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController as Controller;
use HuberwayCMS\Base\Supports\Breadcrumb;

abstract class BaseController extends Controller
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/marketplace::marketplace.name'));
    }
}
