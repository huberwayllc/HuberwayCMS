<?php

namespace HuberwayCMS\Ecommerce\Database\Seeders\Traits;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Facades\MetaBox;
use HuberwayCMS\Ecommerce\Enums\ProductTypeEnum;
use HuberwayCMS\Ecommerce\Models\Brand;
use HuberwayCMS\Ecommerce\Models\Order;
use HuberwayCMS\Ecommerce\Models\OrderAddress;
use HuberwayCMS\Ecommerce\Models\OrderHistory;
use HuberwayCMS\Ecommerce\Models\OrderProduct;
use HuberwayCMS\Ecommerce\Models\Product;
use HuberwayCMS\Ecommerce\Models\ProductCategory;
use HuberwayCMS\Ecommerce\Models\ProductCollection;
use HuberwayCMS\Ecommerce\Models\ProductFile;
use HuberwayCMS\Ecommerce\Models\ProductLabel;
use HuberwayCMS\Ecommerce\Models\ProductTag;
use HuberwayCMS\Ecommerce\Models\ProductVariation;
use HuberwayCMS\Ecommerce\Models\ProductVariationItem;
use HuberwayCMS\Ecommerce\Models\Shipment;
use HuberwayCMS\Ecommerce\Models\ShipmentHistory;
use HuberwayCMS\Ecommerce\Models\Tax;
use HuberwayCMS\Ecommerce\Models\Wishlist;
use HuberwayCMS\Ecommerce\Services\Products\StoreProductService;
use HuberwayCMS\Faq\Models\Faq;
use HuberwayCMS\Payment\Models\Payment;
use HuberwayCMS\Slug\Facades\SlugHelper;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

trait HasProductSeeder
{
    public function createProducts(array $products, bool $truncate = true): void
    {
        if ($truncate) {
            Product::query()->truncate();
            DB::table('ec_product_with_attribute_set')->truncate();
            DB::table('ec_product_variations')->truncate();
            DB::table('ec_product_variation_items')->truncate();
            DB::table('ec_product_collection_products')->truncate();
            DB::table('ec_product_label_products')->truncate();
            DB::table('ec_product_category_product')->truncate();
            DB::table('ec_product_related_relations')->truncate();
            DB::table('ec_tax_products')->truncate();
            Wishlist::query()->truncate();
            Order::query()->truncate();
            OrderAddress::query()->truncate();
            OrderProduct::query()->truncate();
            OrderHistory::query()->truncate();
            Shipment::query()->truncate();
            ShipmentHistory::query()->truncate();
            Payment::query()->truncate();
            ProductFile::query()->truncate();
        }

        $faker = $this->fake();

        $categoryIds = ProductCategory::query()->pluck('id');
        $tagIds = ProductTag::query()->pluck('id');
        $collectionIds = ProductCollection::query()->pluck('id');
        $labelIds = ProductLabel::query()->pluck('id');
        $taxIds = Tax::query()->pluck('id');
        $brandIds = Brand::query()->pluck('id');
        $faqIds = is_plugin_active('faq') ? Faq::query()->pluck('id') : collect();

        foreach ($products as $key => $item) {
            if (isset($item['images'])) {
                $item['images'] = is_array($item['images']) ? json_encode($item['images']) : $item['images'];
            }

            $productName = $item['name'];

            $key = $key + 1;

            if ($key % 4 == 0 && ! isset($item['product_type'])) {
                $item['product_type'] = ProductTypeEnum::DIGITAL;
                $item['name'] .= ' (' . ProductTypeEnum::DIGITAL()->label() . ')';
            }

            $item['status'] = BaseStatusEnum::PUBLISHED;
            $item['views'] = $faker->numberBetween(1000, 200000);
            $item['quantity'] = $faker->numberBetween(10, 20);
            $item['length'] = $faker->numberBetween(10, 20);
            $item['wide'] = $faker->numberBetween(10, 20);
            $item['height'] = $faker->numberBetween(10, 20);
            $item['weight'] = $faker->numberBetween(500, 900);
            $item['with_storehouse_management'] = true;
            $item['brand_id'] = $brandIds->random();
            $item['sku'] = strtoupper(Str::random(2)) . '-' . $faker->numberBetween(100, 200);

            if (! isset($item['price'])) {
                $item['price'] = $faker->numberBetween(250, 2500);
            }

            if (! isset($item['sale_price'])) {
                $item['sale_price'] = $item['price'] - $faker->numberBetween(1, $item['price'] - 2);
            }

            if (! isset($item['is_featured'])) {
                $item['is_featured'] = $faker->boolean();
            }

            $product = Product::query()->create($item);

            $product->productCollections()->sync([$collectionIds->random()]);

            if ($key % 3 == 0) {
                $product->productLabels()->sync([$labelIds->random()]);
            }

            if ($categoryIds->isNotEmpty()) {
                $product->categories()->sync($categoryIds->random($categoryIds->count() > 4 ? 4 : 1)->toArray());
            }

            if ($tagIds->isNotEmpty()) {
                $product->tags()->sync($tagIds->random($tagIds->count() > 3 ? 3 : 1)->toArray());
            }

            if ($taxIds->isNotEmpty()) {
                $product->taxes()->sync([$taxIds->random()]);
            }

            SlugHelper::createSlug($product, $productName);

            if ($faqIds->isNotEmpty()) {
                MetaBox::saveMetaBoxData(
                    $product,
                    'faq_ids',
                    $faqIds->random($faqIds->count() >= 5 ? 5 : 1)->toArray()
                );
            }
        }

        $storeProductService = app(StoreProductService::class);

        foreach ($products as $key => $item) {
            $product = Product::query()->skip($key)->first();

            $key = $key + 1;

            $product->productAttributeSets()->sync($key >= 24 ? [3, 4] : [1, 2]);

            $product->crossSales()->sync([
                $this->random(1, 20, [$key]),
                $this->random(1, 20, [$key]),
                $this->random(1, 20, [$key]),
                $this->random(1, 20, [$key]),
                $this->random(1, 20, [$key]),
                $this->random(1, 20, [$key]),
                $this->random(1, 20, [$key]),
            ]);

            for ($j = 0; $j < $faker->numberBetween(1, 5); $j++) {
                /**
                 * @var Product $variation
                 * @var Product $product
                 */
                $variation = Product::query()->create([
                    'name' => $product->name,
                    'status' => BaseStatusEnum::PUBLISHED,
                    'sku' => $product->sku . '-A' . $j,
                    'quantity' => $product->quantity,
                    'weight' => $product->weight,
                    'height' => $product->height,
                    'wide' => $product->wide,
                    'length' => $product->length,
                    'price' => $product->price,
                    'sale_price' => $key % 4 == 0 ? ($product->price - $product->price * $faker->numberBetween(
                        10,
                        30
                    ) / 100) : null,
                    'brand_id' => $product->brand_id,
                    'with_storehouse_management' => $product->with_storehouse_management,
                    'is_variation' => true,
                    'images' => json_encode([$product->images[$j] ?? Arr::first($product->images)]),
                    'product_type' => $product->product_type,
                ]);

                $productVariation = ProductVariation::query()->create([
                    'product_id' => $variation->getKey(),
                    'configurable_product_id' => $product->getKey(),
                    'is_default' => $j == 0,
                ]);

                if ($productVariation->is_default) {
                    $product->update([
                        'sku' => $variation->sku,
                        'sale_price' => $variation->sale_price,
                    ]);
                }

                ProductVariationItem::query()->create([
                    'attribute_id' => $faker->numberBetween(
                        $key >= 24 ? 11 : 1,
                        $key >= 24 ? 15 : 5
                    ),
                    'variation_id' => $productVariation->id,
                ]);

                ProductVariationItem::query()->create([
                    'attribute_id' => $faker->numberBetween(
                        $key >= 24 ? 16 : 6,
                        $key >= 24 ? 20 : 10
                    ),
                    'variation_id' => $productVariation->id,
                ]);

                if ($product->isTypeDigital()) {
                    foreach ($product->images as $img) {
                        $productFile = database_path('seeders/files/' . $img);

                        if (! File::isFile($productFile)) {
                            continue;
                        }

                        $fileUpload = new UploadedFile(
                            $productFile,
                            Str::replace('products/', '', $img),
                            'image/jpeg',
                            null,
                            true
                        );
                        $productFileData = $storeProductService->saveProductFile($fileUpload);
                        $variation->productFiles()->create($productFileData);
                    }
                }
            }
        }
    }
}
