<?php

namespace HuberwayCMS\Newsletter\Http\Controllers;

use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Newsletter\Models\Newsletter;
use HuberwayCMS\Newsletter\Tables\NewsletterTable;

class NewsletterController extends BaseController
{
    public function index(NewsletterTable $dataTable)
    {
        $this->pageTitle(trans('plugins/newsletter::newsletter.name'));

        return $dataTable->renderTable();
    }

    public function destroy(Newsletter $newsletter)
    {
        return DeleteResourceAction::make($newsletter);
    }
}
