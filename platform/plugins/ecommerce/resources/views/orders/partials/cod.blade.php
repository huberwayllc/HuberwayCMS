<li class="list-group-item">
    <input
        class="magic-radio js_payment_method"
        id="payment_cod"
        name="payment_method"
        type="radio"
        value="cod"
        @if (PaymentMethods::getSelectingMethod() == HuberwayCMS\Payment\Enums\PaymentMethodEnum::COD) checked @endif
    >
    <label class="text-start" for="payment_cod">
        {{ get_payment_setting('name', 'cod', trans('plugins/payment::payment.payment_via_cod')) }}
    </label>
    <div
        class="payment_cod_wrap payment_collapse_wrap collapse @if (PaymentMethods::getSelectingMethod() == HuberwayCMS\Payment\Enums\PaymentMethodEnum::COD) show @endif"
        style="padding: 15px 0;"
    >
        {!! BaseHelper::clean(get_payment_setting('description', 'cod')) !!}

        @php
            $minimumOrderAmount = get_payment_setting('minimum_amount', 'cod', 0);
        @endphp

        @if ($minimumOrderAmount > Cart::instance('cart')->rawSubTotal())
            <div
                class="alert alert-warning"
                style="margin-top: 15px;"
            >
                {{ __('Minimum order amount to use COD (Cash On Delivery) payment method is :amount, you need to buy more :more to place an order!', ['amount' => format_price($minimumOrderAmount), 'more' => format_price($minimumOrderAmount - Cart::instance('cart')->rawSubTotal())]) }}
            </div>
        @endif
    </div>
</li>
