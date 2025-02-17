<?php

namespace HuberwayCMS\Ecommerce\Http\Requests;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Ecommerce\Enums\DiscountTypeEnum;
use HuberwayCMS\Ecommerce\Enums\DiscountTypeOptionEnum;
use HuberwayCMS\Support\Http\Requests\Request;
use Carbon\Carbon;
use Illuminate\Validation\Rule;

class DiscountRequest extends Request
{
    protected function prepareForValidation(): void
    {
        $dateFormat = BaseHelper::getDateTimeFormat();

        $this->merge([
            'can_use_with_promotion' => $this->boolean('can_use_with_promotion'),
            'quantity' => $this->boolean('is_unlimited') ? null : $this->input('quantity'),
            'start_date' => Carbon::parse("{$this->input('start_date')} {$this->input('start_time')}")->format($dateFormat),
            'end_date' => $this->has('end_date') && ! $this->has('unlimited_time') ? Carbon::parse("{$this->input('end_date')} {$this->input('end_time')}")->format($dateFormat) : null,
            'apply_via_url' => $this->boolean('apply_via_url'),
            'display_at_checkout' => $this->boolean('display_at_checkout'),
        ]);
    }

    public function rules(): array
    {
        $dateFormat = BaseHelper::getDateTimeFormat();

        return [
            'title' => ['nullable', 'string', 'required_if:type,promotion', 'max:255'],
            'code' => 'nullable|string|required_if:type,coupon|max:20|unique:ec_discounts,code,' . $this->route('discount.id'),
            'value' => ['required', 'string', 'numeric', 'min:0'],
            'target' => ['required'],
            'can_use_with_promotion' => ['nullable', 'boolean'],
            'type' => ['required', Rule::in(DiscountTypeEnum::values())],
            'type_option' => ['required', Rule::in(DiscountTypeOptionEnum::values())],
            'quantity' => [
                Rule::requiredIf(function () {
                    return $this->input('type') === 'coupon' && ! $this->boolean('is_unlimited');
                }),
                'nullable',
                'numeric',
                'min:1',
            ],
            'min_order_price' => ['nullable', 'numeric', 'min:0'],
            'product_quantity' => ['nullable', 'numeric', 'min:0'],
            'discount_on' => ['nullable', 'string', 'max:40'],
            'start_date' => ['nullable', 'date', 'date_format:' . $dateFormat],
            'end_date' => ['nullable', 'date', 'date_format:' . $dateFormat, 'after_or_equal:start_date'],
            'apply_via_url' => ['nullable', 'boolean'],
            'display_at_checkout' => ['nullable', 'boolean'],
            'description' => ['nullable', 'string', 'max:255'],
        ];
    }

    public function messages(): array
    {
        return [
            'title.required_if' => trans('plugins/ecommerce::discount.create_discount_validate_title_required_if'),
            'code.required_if' => trans('plugins/ecommerce::discount.create_discount_validate_code_required_if'),
            'value.required' => trans('plugins/ecommerce::discount.create_discount_validate_value_required'),
            'target.required' => trans('plugins/ecommerce::discount.create_discount_validate_target_required'),
        ];
    }
}
