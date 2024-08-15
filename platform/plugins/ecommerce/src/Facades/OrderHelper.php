<?php

namespace HuberwayCMS\Ecommerce\Facades;

use HuberwayCMS\Ecommerce\Supports\OrderHelper as BaseOrderHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \Illuminate\Support\Collection|\Illuminate\Database\Eloquent\Model|array|bool processOrder(array|string|null $orderIds, string|null $chargeId = null)
 * @method static bool decreaseProductQuantity(\HuberwayCMS\Ecommerce\Models\Order $order)
 * @method static \HuberwayCMS\Base\Supports\EmailHandler setEmailVariables(\HuberwayCMS\Ecommerce\Models\Order $order)
 * @method static array getEmailVariables(\HuberwayCMS\Ecommerce\Models\Order $order)
 * @method static bool sendOrderConfirmationEmail(\HuberwayCMS\Ecommerce\Models\Order $order, bool $saveHistory = false)
 * @method static void sendEmailForDigitalProducts(\HuberwayCMS\Ecommerce\Models\Order $order)
 * @method static \HuberwayCMS\Ecommerce\Models\Order setOrderCompleted(string|int $orderId, \Illuminate\Http\Request $request, string|int $userId = 0)
 * @method static array|string|null getShippingMethod(string $method, array|string|null $option = null)
 * @method static string|null processHistoryVariables(\HuberwayCMS\Ecommerce\Models\OrderHistory|\HuberwayCMS\Ecommerce\Models\ShipmentHistory $history)
 * @method static array setOrderSessionData(string|null $token, array|string $data)
 * @method static string getOrderSessionToken()
 * @method static array getOrderSessionData(string|null $token = null)
 * @method static array cleanData(array $data)
 * @method static array mergeOrderSessionData(string|null $token, array|string $data)
 * @method static void clearSessions(string|null $token)
 * @method static array handleAddCart(\HuberwayCMS\Ecommerce\Models\Product $product, \Illuminate\Http\Request $request)
 * @method static array getProductOptionData(array $data)
 * @method static array processAddressOrder(string|int $currentUserId, array $sessionData, \Illuminate\Http\Request $request)
 * @method static array checkAndCreateOrderAddress(array $addressData, array $sessionData)
 * @method static array processOrderProductData(\Illuminate\Support\Collection|array $products, array $sessionData)
 * @method static array processOrderInCheckout($sessionData, $request, $cartItems, $order, array $generalData)
 * @method static mixed createOrder(\Illuminate\Http\Request $request, string|int $currentUserId, string $token, array $cartItems)
 * @method static bool confirmPayment(\HuberwayCMS\Ecommerce\Models\Order $order)
 * @method static \HuberwayCMS\Ecommerce\Models\Order cancelOrder(\HuberwayCMS\Ecommerce\Models\Order $order)
 * @method static \HuberwayCMS\Ecommerce\Models\Order shippingStatusDelivered(\HuberwayCMS\Ecommerce\Models\Shipment $shipment, \Illuminate\Http\Request $request, string|int $userId = 0)
 * @method static string|null getOrderBankInfo(\HuberwayCMS\Ecommerce\Models\Order|\Illuminate\Database\Eloquent\Collection $orders)
 *
 * @see \HuberwayCMS\Ecommerce\Supports\OrderHelper
 */
class OrderHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseOrderHelper::class;
    }
}
