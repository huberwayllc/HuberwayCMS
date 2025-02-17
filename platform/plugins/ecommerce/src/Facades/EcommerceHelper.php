<?php

namespace HuberwayCMS\Ecommerce\Facades;

use HuberwayCMS\Ecommerce\Supports\EcommerceHelper as BaseEcommerceHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static bool isCartEnabled()
 * @method static bool isWishlistEnabled()
 * @method static bool isCompareEnabled()
 * @method static bool isReviewEnabled()
 * @method static bool isOrderTrackingEnabled()
 * @method static bool isOrderAutoConfirmedEnabled()
 * @method static float reviewMaxFileSize(bool $isConvertToKB = false)
 * @method static int reviewMaxFileNumber()
 * @method static \Illuminate\Support\Collection getReviewsGroupedByProductId(string|int $productId, int $reviewsCount = 0)
 * @method static bool isQuickBuyButtonEnabled()
 * @method static string getQuickBuyButtonTarget()
 * @method static bool isZipCodeEnabled()
 * @method static bool isBillingAddressEnabled()
 * @method static bool isDisplayProductIncludingTaxes()
 * @method static bool isTaxEnabled()
 * @method static array getAvailableCountries()
 * @method static array getAvailableStatesByCountry(string|int|null $countryId)
 * @method static array getAvailableCitiesByState(string|int|null $stateId, string|int|null $countryId = null)
 * @method static array getSortParams()
 * @method static array getShowParams()
 * @method static float getMinimumOrderAmount()
 * @method static bool isEnabledGuestCheckout()
 * @method static bool showNumberOfProductsInProductSingle()
 * @method static bool showOutOfStockProducts()
 * @method static array getDateRangeInReport(\Illuminate\Http\Request $request)
 * @method static string|null getSettingPrefix()
 * @method static bool isEnableEmailVerification()
 * @method static bool disableOrderInvoiceUntilOrderConfirmed()
 * @method static bool isEnabledProductOptions()
 * @method static string getPhoneValidationRule()
 * @method static \Illuminate\Pagination\LengthAwarePaginator getProductReviews(\HuberwayCMS\Ecommerce\Models\Product $product, int $star = 0, int $perPage = 10)
 * @method static string getThousandSeparatorForInputMask()
 * @method static string getDecimalSeparatorForInputMask()
 * @method static array withReviewsParams()
 * @method static bool loadCountriesStatesCitiesFromPluginLocation()
 * @method static string|null getCountryNameById(string|int|null $countryId)
 * @method static array getStates(string|null $countryCode)
 * @method static array getCities(string|int|null $stateId)
 * @method static bool isUsingInMultipleCountries()
 * @method static string|int getFirstCountryId()
 * @method static array getCustomerAddressValidationRules(string|null $prefix = '')
 * @method static bool isEnabledCustomerRecentlyViewedProducts()
 * @method static int maxCustomerRecentlyViewedProducts()
 * @method static \HuberwayCMS\Ecommerce\Supports\EcommerceHelper handleCustomerRecentlyViewedProduct(\HuberwayCMS\Ecommerce\Models\Product $product)
 * @method static array getProductVariationInfo(\HuberwayCMS\Ecommerce\Models\Product $product, array $params = [])
 * @method static array getProductsSearchBy()
 * @method static int|float validateOrderWeight(int|float $weight)
 * @method static bool isFacebookPixelEnabled()
 * @method static bool isGoogleTagManagerEnabled()
 * @method static int getReturnableDays()
 * @method static bool canCustomReturnProductQty()
 * @method static bool isOrderReturnEnabled()
 * @method static bool allowPartialReturn()
 * @method static bool isAvailableShipping(\Illuminate\Support\Collection $products)
 * @method static int countDigitalProducts(\Illuminate\Support\Collection $products)
 * @method static bool canCheckoutForDigitalProducts(\Illuminate\Support\Collection $products)
 * @method static bool isEnabledSupportDigitalProducts()
 * @method static bool allowGuestCheckoutForDigitalProducts()
 * @method static bool isSaveOrderShippingAddress(\Illuminate\Support\Collection $products)
 * @method static bool productFilterParamsValidated(\Illuminate\Http\Request $request)
 * @method static string viewPath(string $view)
 * @method static array getOriginAddress()
 * @method static array getShippingData(\Illuminate\Support\Collection|array $products, array $session, array $origin, float $orderTotal, string|null $paymentMethod = null)
 * @method static bool onlyAllowCustomersPurchasedToReview()
 * @method static bool isValidToProcessCheckout()
 * @method static array getMandatoryFieldsAtCheckout()
 * @method static array getEnabledMandatoryFieldsAtCheckout()
 * @method static array getHiddenFieldsAtCheckout()
 * @method static array withProductEagerLoadingRelations()
 * @method static bool isDisplayTaxFieldsAtCheckoutPage()
 * @method static int getProductMaxPrice(array $categoryIds = [])
 * @method static void clearProductMaxPriceCache()
 * @method static bool isEnabledFilterProductsByBrands()
 * @method static bool isEnabledFilterProductsByTags()
 * @method static bool isEnabledFilterProductsByAttributes()
 * @method static \Illuminate\Support\Collection brandsForFilter(array $categoryIds = [])
 * @method static \Illuminate\Support\Collection tagsForFilter(array $categoryIds = [])
 * @method static array dataForFilter(\HuberwayCMS\Ecommerce\Models\ProductCategory|null $category)
 * @method static array dataPriceRangesForFilter()
 * @method static bool isPriceRangesChecked(float $fromPrice, float $toPrice)
 * @method static array dataPriceRanges(int $stepPrice = 1000, int $stepCount = 10)
 * @method static bool useCityFieldAsTextField()
 * @method static bool isLoginUsingPhone()
 * @method static void registerThemeAssets()
 *
 * @see \HuberwayCMS\Ecommerce\Supports\EcommerceHelper
 */
class EcommerceHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseEcommerceHelper::class;
    }
}
