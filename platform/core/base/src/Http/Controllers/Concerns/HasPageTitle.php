<?php

namespace HuberwayCMS\Base\Http\Controllers\Concerns;

use HuberwayCMS\Base\Facades\PageTitle;

trait HasPageTitle
{
    protected function pageTitle(string $title, bool $registerBreadcrumb = true): void
    {
        PageTitle::setTitle($title);

        if ($registerBreadcrumb && method_exists($this, 'breadcrumb')) {
            $this->breadcrumb()->add($title);
        }
    }

    protected function getPageTitle($withSiteName = true): string
    {
        return PageTitle::getTitle($withSiteName);
    }
}
