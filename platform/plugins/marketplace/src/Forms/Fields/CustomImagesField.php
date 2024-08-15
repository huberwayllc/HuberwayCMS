<?php

namespace HuberwayCMS\Marketplace\Forms\Fields;

use HuberwayCMS\Base\Forms\FormField;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;

class CustomImagesField extends FormField
{
    protected function getTemplate(): string
    {
        return MarketplaceHelper::viewPath('vendor-dashboard.forms.fields.custom-images');
    }
}
