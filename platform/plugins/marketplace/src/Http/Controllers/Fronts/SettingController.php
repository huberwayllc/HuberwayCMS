<?php

namespace HuberwayCMS\Marketplace\Http\Controllers\Fronts;

use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Facades\MetaBox;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Marketplace\Facades\MarketplaceHelper;
use HuberwayCMS\Marketplace\Forms\PayoutInformationForm;
use HuberwayCMS\Marketplace\Forms\TaxInformationForm;
use HuberwayCMS\Marketplace\Forms\VendorStoreForm;
use HuberwayCMS\Marketplace\Http\Requests\Fronts\VendorStoreRequest;
use HuberwayCMS\Marketplace\Http\Requests\PayoutInformationSettingRequest;
use HuberwayCMS\Marketplace\Http\Requests\TaxInformationSettingRequest;
use HuberwayCMS\Marketplace\Models\Store;
use HuberwayCMS\Media\Facades\RvMedia;
use HuberwayCMS\Slug\Facades\SlugHelper;

class SettingController extends BaseController
{
    public function index()
    {
        $this->pageTitle(__('Settings'));

        Assets::addScriptsDirectly('vendor/core/plugins/location/js/location.js');

        $store = auth('customer')->user()->store;

        $form = VendorStoreForm::createFromModel($store)
            ->renderForm();

        $taxInformationForm = TaxInformationForm::createFromModel($store->customer)
            ->setUrl(route('marketplace.vendor.settings.post.tax-info'))
            ->renderForm();

        $payoutInformationForm = PayoutInformationForm::createFromModel($store->customer)
            ->setUrl(route('marketplace.vendor.settings.post.payout'))
            ->renderForm();

        return MarketplaceHelper::view(
            'vendor-dashboard.stores.form',
            compact('store', 'form', 'taxInformationForm', 'payoutInformationForm')
        );
    }

    public function saveSettings(VendorStoreRequest $request)
    {
        $store = auth('customer')->user()->store;

        $storeForm = VendorStoreForm::createFromModel($store);

        $storeForm->saving(function (VendorStoreForm $form) use ($request) {

            $store = $form->getModel();

            $existing = SlugHelper::getSlug($request->input('slug'), SlugHelper::getPrefix(Store::class));

            if ($existing && $existing->reference_id != $store->id) {
                return $this->httpResponse()->setError()->setMessage(__('Shop URL is existing. Please choose another one!'));
            }

            if ($request->hasFile('logo_input')) {
                $result = RvMedia::handleUpload($request->file('logo_input'), 0, $store->upload_folder);
                if (! $result['error']) {
                    $file = $result['data'];
                    $request->merge(['logo' => $file->url]);
                }
            }

            if ($request->hasFile('cover_image_input')) {
                $result = RvMedia::handleUpload($request->file('cover_image_input'), 0, 'stores');
                if (! $result['error']) {
                    MetaBox::saveMetaBoxData($store, 'cover_image', $result['data']->url);
                }
            } elseif ($request->input('cover_image')) {
                MetaBox::saveMetaBoxData($store, 'cover_image', $request->input('cover_image'));
            } elseif ($request->has('cover_image')) {
                MetaBox::deleteMetaData($store, 'cover_image');
            }

            $store->fill($request->input());
            $store->save();

            $request->merge(['is_slug_editable' => 1]);
        });

        return $this
            ->httpResponse()
            ->setNextUrl(route('marketplace.vendor.settings'))
            ->setMessage(__('Update successfully!'));
    }

    public function updateTaxInformation(TaxInformationSettingRequest $request)
    {
        /** @var Store $store */
        $store = auth('customer')->user()->store;

        $customer = $store->customer;

        if ($customer && $customer->getKey()) {
            $customer->vendorInfo->update($request->validated());
        }

        event(new UpdatedContentEvent(STORE_MODULE_SCREEN_NAME, $request, $store));

        return $this->httpResponse()
            ->setMessage(__('Update successfully!'))
            ->setNextUrl(route('marketplace.vendor.settings'));
    }

    public function updatePayoutInformation(PayoutInformationSettingRequest $request)
    {
        /** @var Store $store */
        $store = auth('customer')->user()->store;

        $customer = $store->customer;

        if ($customer && $customer->id) {
            $vendorInfo = $customer->vendorInfo;
            $vendorInfo->payout_payment_method = $request->input('payout_payment_method');
            $vendorInfo->bank_info = $request->input('bank_info', []);
            $vendorInfo->save();
        }

        event(new UpdatedContentEvent(STORE_MODULE_SCREEN_NAME, $request, $store));

        return $this
            ->httpResponse()
            ->setMessage(__('Update successfully!'))
            ->setNextUrl(route('marketplace.vendor.settings'));
    }
}
