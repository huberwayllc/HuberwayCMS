<x-core::form :url="$url">
    <x-core::form.select
        :label="trans('plugins/ecommerce::shipping.status')"
        name="status"
        :options="HuberwayCMS\Ecommerce\Enums\ShippingStatusEnum::labels()"
        :value="$shipment->status"
    />
</x-core::form>
