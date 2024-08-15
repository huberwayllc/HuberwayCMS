<?php

namespace HuberwayCMS\Marketplace\Forms;

use HuberwayCMS\Marketplace\Forms\Fields\CustomEditorField;
use HuberwayCMS\Marketplace\Http\Requests\Fronts\VendorStoreRequest;

class VendorStoreForm extends StoreForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setValidatorClass(VendorStoreRequest::class)
            ->modify('content', CustomEditorField::class)
            ->remove(['status', 'customer_id']);
    }
}
