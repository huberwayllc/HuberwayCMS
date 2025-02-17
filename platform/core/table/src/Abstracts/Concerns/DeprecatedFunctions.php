<?php

namespace HuberwayCMS\Table\Abstracts\Concerns;

use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Media\Facades\RvMedia;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use Illuminate\Support\HtmlString;

trait DeprecatedFunctions
{
    /**
     * @deprecated since v6.8.0, use `DeleteBulkAction::class` instead.
     */
    protected function addDeleteAction(string $url, string|null $permission = null, array $actions = []): array
    {
        return $actions + [
                DeleteBulkAction::make()->action('DELETE')->permission((string)$permission)->dispatchUrl(
                    $url
                ),
            ];
    }

    /**
     * @deprecated
     */
    protected function getCheckbox(int|string $id): string
    {
        return view('core/table::partials.checkbox', compact('id'))->render();
    }

    /**
     * @deprecated
     */
    protected function displayThumbnail(string|null $image, array $attributes = ['width' => 50], bool $relative = false): HtmlString|string
    {
        if ($this->request()->has('action')) {
            if ($this->isExportingToCSV()) {
                return RvMedia::getImageUrl($image, null, $relative, RvMedia::getDefaultImage());
            }

            if ($this->isExportingToExcel()) {
                return RvMedia::getImageUrl($image, 'thumb', $relative, RvMedia::getDefaultImage());
            }
        }

        return Html::image(
            RvMedia::getImageUrl($image, 'thumb', $relative, RvMedia::getDefaultImage()),
            trans('core/base::tables.image'),
            $attributes
        );
    }
}
