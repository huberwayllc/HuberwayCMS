<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Http\Requests\UpdatePrimaryStoreRequest;
use HuberwayCMS\Ecommerce\Models\StoreLocator;

class ChangePrimaryStoreController extends BaseController
{
    public function __invoke(UpdatePrimaryStoreRequest $request)
    {
        $storeLocator = StoreLocator::query()->findOrFail($request->input('primary_store_id'));

        StoreLocator::query()->where('id', '!=', $storeLocator->getKey())->update(['is_primary' => false]);

        $storeLocator->update([
            'is_primary' => true,
        ]);

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }
}
