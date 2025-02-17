<?php

use HuberwayCMS\Ads\Facades\AdsManager;
use HuberwayCMS\Ads\Repositories\Interfaces\AdsInterface;
use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Models\FlashSale;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\FlashSaleInterface;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductCategoryInterface;
use HuberwayCMS\Ecommerce\Repositories\Interfaces\ProductInterface;
use HuberwayCMS\Faq\Repositories\Interfaces\FaqCategoryInterface;
use HuberwayCMS\Shortcode\Compilers\Shortcode;
use HuberwayCMS\Theme\Facades\Theme;
use HuberwayCMS\Theme\Supports\ThemeSupport;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    if (is_plugin_active('ecommerce')) {
        add_shortcode(
            'featured-product-categories',
            __('Featured Product Categories'),
            __('Featured Product Categories'),
            function ($shortCode) {
                $categories = get_featured_product_categories(['take' => null]);

                return Theme::partial('short-codes.featured-product-categories', [
                    'title' => $shortCode->title,
                    'categories' => $categories,
                ]);
            }
        );

        shortcode()->setAdminConfig('featured-product-categories', function ($attributes) {
            return Theme::partial('short-codes.featured-product-categories-admin-config', compact('attributes'));
        });

        add_shortcode('featured-products', __('Featured products'), __('Featured products'), function ($shortCode) {
            $products = get_featured_products([
                    'take' => (int) $shortCode->limit ?: 10,
                ] + EcommerceHelper::withReviewsParams());

            return Theme::partial('short-codes.featured-products', [
                'title' => $shortCode->title,
                'limit' => $shortCode->limit,
                'products' => $products,
            ]);
        });

        shortcode()->setAdminConfig('featured-products', function ($attributes) {
            return Theme::partial('short-codes.featured-products-admin-config', compact('attributes'));
        });

        add_shortcode('featured-brands', __('Featured Brands'), __('Featured Brands'), function ($shortCode) {
            $brands = get_featured_brands();

            return Theme::partial('short-codes.featured-brands', [
                'title' => $shortCode->title,
                'brands' => $brands,
            ]);
        });

        shortcode()->setAdminConfig('featured-brands', function ($attributes) {
            return Theme::partial('short-codes.featured-brands-admin-config', compact('attributes'));
        });

        add_shortcode(
            'product-collections',
            __('Product Collections'),
            __('Product Collections'),
            function (Shortcode $shortcode) {
                $productCollections = get_product_collections(
                    ['status' => BaseStatusEnum::PUBLISHED],
                    [],
                    ['id', 'name', 'slug']
                );

                if ($productCollections->isEmpty()) {
                    return null;
                }

                $limit = (int)$shortcode->limit ?: 8;

                $products = get_products_by_collections(array_merge([
                    'collections' => [
                        'by' => 'id',
                        'value_in' => [$productCollections->first()->id],
                    ],
                    'take' => $limit,
                    'with' => EcommerceHelper::withProductEagerLoadingRelations(),
                ], EcommerceHelper::withReviewsParams()));

                return Theme::partial('short-codes.product-collections', [
                    'title' => $shortcode->title,
                    'productCollections' => $productCollections,
                    'limit' => $limit,
                    'products' => $products,
                ]);
            }
        );

        shortcode()->setAdminConfig('product-collections', function (array $attributes) {
            return Theme::partial('short-codes.product-collections-admin-config', compact('attributes'));
        });

        add_shortcode(
            'product-category-products',
            __('Product category products'),
            __('Product category products'),
            function (Shortcode $shortcode) {
                $category = app(ProductCategoryInterface::class)->getFirstBy(
                    [
                        'status' => BaseStatusEnum::PUBLISHED,
                        'id' => (int)$shortcode->category_id,
                    ],
                    ['*'],
                    [
                        'activeChildren' => function ($query) {
                            return $query->limit(3);
                        },
                    ]
                );

                if (! $category) {
                    return null;
                }

                $limit = (int)$shortcode->limit ?: 8;

                $products = app(ProductInterface::class)->getProductsByCategories(array_merge([
                    'categories' => [
                        'by' => 'id',
                        'value_in' => array_merge([$category->id], $category->activeChildren->pluck('id')->all()),
                    ],
                    'take' => $limit,
                ], EcommerceHelper::withReviewsParams()));

                return Theme::partial('short-codes.product-category-products', compact('category', 'products', 'limit'));
            }
        );

        shortcode()->setAdminConfig('product-category-products', function (array $attributes) {
            return Theme::partial('short-codes.product-category-products-admin-config', compact('attributes'));
        });

        add_shortcode('trending-products', __('Trending Products'), __('Trending Products'), function ($shortCode) {
            $products = get_trending_products([
                    'take' => (int) $shortCode->limit ?: 10,
                ] + EcommerceHelper::withReviewsParams());

            return Theme::partial('short-codes.trending-products', [
                'title' => $shortCode->title,
                'products' => $products,
            ]);
        });

        shortcode()->setAdminConfig('trending-products', function ($attributes) {
            return Theme::partial('short-codes.trending-products-admin-config', compact('attributes'));
        });

        add_shortcode('flash-sale', __('Flash sale'), __('Flash sale'), function ($shortCode) {
            if (! $shortCode->flash_sale_id) {
                return null;
            }

            $flashSale = FlashSale::query()
                ->notExpired()
                ->where('id', $shortCode->flash_sale_id)
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->with([
                    'products' => function ($query) {
                        $reviewParams = EcommerceHelper::withReviewsParams();

                        if (EcommerceHelper::isReviewEnabled()) {
                            $query->withAvg($reviewParams['withAvg'][0], $reviewParams['withAvg'][1]);
                        }

                        return $query
                            ->where('status', BaseStatusEnum::PUBLISHED)
                            ->withCount($reviewParams['withCount'])
                            ->with(EcommerceHelper::withProductEagerLoadingRelations());
                    },
                ])
                ->first();

            if (! $flashSale) {
                return null;
            }

            return Theme::partial('short-codes.flash-sale', [
                'title' => $shortCode->title,
                'flashSale' => $flashSale,
            ]);
        });

        shortcode()->setAdminConfig('flash-sale', function ($attributes) {
            $flashSales = app(FlashSaleInterface::class)
                ->getModel()
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->notExpired()
                ->get();

            return Theme::partial('short-codes.flash-sale-admin-config', compact('flashSales', 'attributes'));
        });
    }

    if (is_plugin_active('simple-slider')) {
        add_filter(SIMPLE_SLIDER_VIEW_TEMPLATE, function () {
            return Theme::getThemeNamespace() . '::partials.short-codes.sliders';
        }, 120);

        add_filter(SHORTCODE_REGISTER_CONTENT_IN_ADMIN, function ($data, $key, $attributes) {
            if ($key == 'simple-slider') {
                $ads = app(AdsInterface::class)->getModel()
                    ->where('status', BaseStatusEnum::PUBLISHED)
                    ->notExpired()
                    ->get();

                $maxAds = 2;

                return $data . Theme::partial('short-codes.select-ads-admin-config', compact('ads', 'attributes', 'maxAds'));
            }

            return $data;
        }, 50, 3);

        function get_ads_keys_from_shortcode(Shortcode $shortcode): array
        {
            $keys = collect($shortcode->toArray())
                ->sortKeys()
                ->filter(function ($value, $key) use ($shortcode) {
                    return Str::startsWith($key, 'ads_') ||
                        ($shortcode->name == 'theme-ads' && Str::startsWith($key, 'key_'));
                });

            return array_filter($keys->toArray() + [$shortcode->ads]);
        }
    }

    if (is_plugin_active('newsletter')) {
        add_shortcode('newsletter-form', __('Newsletter Form'), __('Newsletter Form'), function ($shortCode) {
            return Theme::partial('short-codes.newsletter-form', [
                'title' => $shortCode->title,
                'description' => $shortCode->description,
                'subtitle' => $shortCode->subtitle,
            ]);
        });

        shortcode()->setAdminConfig('newsletter-form', function ($attributes) {
            return Theme::partial('short-codes.newsletter-form-admin-config', compact('attributes'));
        });
    }

    add_shortcode('download-app', __('Download Apps'), __('Download Apps'), function ($shortCode) {
        return Theme::partial('short-codes.download-app', [
            'title' => $shortCode->title,
            'description' => $shortCode->description,
            'subtitle' => $shortCode->subtitle,
            'screenshot' => $shortCode->screenshot,
            'androidAppUrl' => $shortCode->android_app_url,
            'iosAppUrl' => $shortCode->ios_app_url,
        ]);
    });

    shortcode()->setAdminConfig('download-app', function ($attributes) {
        return Theme::partial('short-codes.download-app-admin-config', compact('attributes'));
    });

    if (is_plugin_active('faq')) {
        add_shortcode('faq', __('FAQs'), __('FAQs'), function ($shortCode) {
            $categories = app(FaqCategoryInterface::class)
                ->advancedGet([
                    'condition' => [
                        'status' => BaseStatusEnum::PUBLISHED,
                    ],
                    'with' => [
                        'faqs' => function ($query) {
                            $query->where('status', BaseStatusEnum::PUBLISHED);
                        },
                    ],
                    'order_by' => [
                        'faq_categories.order' => 'ASC',
                        'faq_categories.created_at' => 'DESC',
                    ],
                ]);

            return Theme::partial('short-codes.faq', [
                'title' => $shortCode->title,
                'categories' => $categories,
            ]);
        });

        shortcode()->setAdminConfig('faq', function ($attributes) {
            return Theme::partial('short-codes.faq-admin-config', compact('attributes'));
        });
    }

    add_shortcode('site-features', __('Site features'), __('Site features'), function ($shortcode) {
        return Theme::partial('short-codes.site-features', compact('shortcode'));
    });

    shortcode()->setAdminConfig('site-features', function ($attributes) {
        return Theme::partial('short-codes.site-features-admin-config', compact('attributes'));
    });

    if (is_plugin_active('contact')) {
        add_filter(CONTACT_FORM_TEMPLATE_VIEW, function () {
            return Theme::getThemeNamespace() . '::partials.short-codes.contact-form';
        }, 120);
    }

    add_shortcode('contact-info-boxes', __('Contact info boxes'), __('Contact info boxes'), function ($shortCode) {
        return Theme::partial('short-codes.contact-info-boxes', ['title' => $shortCode->title]);
    });

    shortcode()->setAdminConfig('contact-info-boxes', function ($attributes) {
        return Theme::partial('short-codes.contact-info-boxes-admin-config', compact('attributes'));
    });

    if (is_plugin_active('ads')) {
        add_shortcode('theme-ads', __('Theme ads'), __('Theme ads'), function ($shortCode) {
            $ads = [];
            $attributes = $shortCode->toArray();

            for ($i = 1; $i < 5; $i++) {
                if (isset($attributes['key_' . $i]) && ! empty($attributes['key_' . $i])) {
                    $ad = AdsManager::displayAds((string)$attributes['key_' . $i]);
                    if ($ad) {
                        $ads[] = $ad;
                    }
                }
            }

            $ads = array_filter($ads);

            return Theme::partial('short-codes.theme-ads', compact('ads'));
        });

        shortcode()->setAdminConfig('theme-ads', function ($attributes) {
            $ads = app(AdsInterface::class)->getModel()
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->notExpired()
                ->get();

            return Theme::partial('short-codes.theme-ads-admin-config', compact('ads', 'attributes'));
        });
    }

    add_shortcode('coming-soon', __('Coming soon'), __('Coming soon'), function ($shortCode) {
        return Theme::partial('short-codes.coming-soon', [
            'time' => $shortCode->time,
            'image' => $shortCode->image,
        ]);
    });

    shortcode()->setAdminConfig('coming-soon', function ($attributes) {
        return Theme::partial('short-codes.coming-soon-admin-config', compact('attributes'));
    });
});
