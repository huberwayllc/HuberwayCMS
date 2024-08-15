<?php

namespace HuberwayCMS\Marketplace\Http\Controllers;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;

class ProductController extends BaseController
{
    public function approveProduct(int|string $id)
    {
        $product = Product::query()->findOrFail($id);

        $product->status = BaseStatusEnum::PUBLISHED;
        $product->approved_by = auth()->id();

        $product->save();

        if (MarketplaceHelper::getSetting('enable_product_approval', 1)) {
            $store = $product->store;

            EmailHandler::setModule(MARKETPLACE_MODULE_SCREEN_NAME)
                ->setVariableValues([
                    'store_name' => $store->name,
                ])
                ->sendUsingTemplate('product-approved', $store->email);
        }

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/marketplace::store.approve_product_success'));
    }
}
