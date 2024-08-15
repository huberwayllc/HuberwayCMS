<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers\Customers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Supports\Breadcrumb;
use HuberwayCMS\Ecommerce\Forms\CustomerForm;
use HuberwayCMS\Ecommerce\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Http\Requests\AddCustomerWhenCreateOrderRequest;
use HuberwayCMS\Ecommerce\Http\Requests\CustomerCreateRequest;
use HuberwayCMS\Ecommerce\Http\Requests\CustomerEditRequest;
use HuberwayCMS\Ecommerce\Http\Requests\CustomerUpdateEmailRequest;
use HuberwayCMS\Ecommerce\Http\Resources\CustomerAddressResource;
use HuberwayCMS\Ecommerce\Models\Address;
use HuberwayCMS\Ecommerce\Models\Customer;
use HuberwayCMS\Ecommerce\Tables\CustomerReviewTable;
use HuberwayCMS\Ecommerce\Tables\CustomerTable;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class CustomerController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/ecommerce::customer.name'), route('customers.index'));
    }

    public function index(CustomerTable $dataTable)
    {
        $this->pageTitle(trans('plugins/ecommerce::customer.name'));

        return $dataTable->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/ecommerce::customer.create'));

        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/customer.js');

        return CustomerForm::create()->remove('is_change_password')->renderForm();
    }

    public function store(CustomerCreateRequest $request)
    {
        $customer = new Customer();
        $customer->fill($request->input());
        $customer->confirmed_at = Carbon::now();
        $customer->password = Hash::make($request->input('password'));
        $customer->dob = Carbon::parse($request->input('dob'));
        $customer->save();

        event(new CreatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('customers.index'))
            ->setNextUrl(route('customers.edit', $customer->id))
            ->withCreatedSuccessMessage();
    }

    public function edit(int|string $id)
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/customer.js');

        $customer = Customer::query()->findOrFail($id);

        $this->pageTitle(trans('plugins/ecommerce::customer.edit', ['name' => $customer->name]));

        $customer->password = null;

        return CustomerForm::createFromModel($customer)->renderForm();
    }

    public function update(int|string $id, CustomerEditRequest $request)
    {
        $customer = Customer::query()->findOrFail($id);

        $customer->fill($request->except('password'));

        if ($request->input('is_change_password') == 1) {
            $customer->password = Hash::make($request->input('password'));
        }

        $customer->dob = Carbon::parse($request->input('dob'));

        $customer->save();

        event(new UpdatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('customers.index'))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(int|string $id, Request $request)
    {
        try {
            $customer = Customer::query()->findOrFail($id);
            $customer->delete();
            event(new DeletedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

            return $this
                ->httpResponse()
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function verifyEmail(int|string $id, Request $request)
    {
        $customer = Customer::query()
            ->where([
                'id' => $id,
                'confirmed_at' => null,
            ])->firstOrFail();

        $customer->confirmed_at = Carbon::now();
        $customer->save();

        event(new UpdatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('customers.index'))
            ->withUpdatedSuccessMessage();
    }

    public function getListCustomerForSelect()
    {
        $customers = Customer::query()
            ->select(['id', 'name'])
            ->get()
            ->toArray();

        return $this
            ->httpResponse()
            ->setData($customers);
    }

    public function getListCustomerForSearch(Request $request)
    {
        $customers = Customer::query()
            ->where('name', 'LIKE', '%' . $request->input('keyword') . '%')
            ->simplePaginate(5);

        foreach ($customers as &$customer) {
            $customer->avatar_url = (string)$customer->avatar_url;
        }

        return $this
            ->httpResponse()->setData($customers);
    }

    public function postUpdateEmail($id, CustomerUpdateEmailRequest $request)
    {
        $customer = Customer::query()->findOrFail($id);

        $customer->email = $request->input('email');
        $customer->save();

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function getCustomerAddresses($id)
    {
        $addresses = Address::query()->where('customer_id', $id)->get();

        return $this
            ->httpResponse()
            ->setData(CustomerAddressResource::collection($addresses));
    }

    public function getCustomerOrderNumbers($id)
    {
        $customer = Customer::query()->find($id);

        if (! $customer) {
            return $this
                ->httpResponse()
                ->setData(0);
        }

        return $this
            ->httpResponse()
            ->setData($customer->orders()->count());
    }

    public function postCreateCustomerWhenCreatingOrder(AddCustomerWhenCreateOrderRequest $request)
    {
        $request->merge(['password' => Hash::make(Str::random(36))]);
        $customer = Customer::query()->create($request->input());
        $customer->avatar = (string)$customer->avatar_url;

        event(new CreatedContentEvent(CUSTOMER_MODULE_SCREEN_NAME, $request, $customer));

        $request->merge([
            'customer_id' => $customer->id,
            'is_default' => true,
        ]);

        $address = Address::query()->create($request->input());

        $address->country = $address->country_name;
        $address->state = $address->state_name;
        $address->city = $address->city_name;

        return $this
            ->httpResponse()
            ->setData(compact('address', 'customer'))
            ->withCreatedSuccessMessage();
    }

    public function ajaxReviews(int|string $id, CustomerReviewTable $customerReviewTable)
    {
        return $customerReviewTable->customerId($id)->renderTable();
    }
}
