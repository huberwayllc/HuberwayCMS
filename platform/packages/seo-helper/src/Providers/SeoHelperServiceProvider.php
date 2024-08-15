<?php

namespace HuberwayCMS\SeoHelper\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\SeoHelper\Contracts\SeoHelperContract;
use HuberwayCMS\SeoHelper\Contracts\SeoMetaContract;
use HuberwayCMS\SeoHelper\Contracts\SeoOpenGraphContract;
use HuberwayCMS\SeoHelper\Contracts\SeoTwitterContract;
use HuberwayCMS\SeoHelper\SeoHelper;
use HuberwayCMS\SeoHelper\SeoMeta;
use HuberwayCMS\SeoHelper\SeoOpenGraph;
use HuberwayCMS\SeoHelper\SeoTwitter;

/**
 * @since 02/12/2015 14:09 PM
 */
class SeoHelperServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(SeoMetaContract::class, SeoMeta::class);
        $this->app->bind(SeoHelperContract::class, SeoHelper::class);
        $this->app->bind(SeoOpenGraphContract::class, SeoOpenGraph::class);
        $this->app->bind(SeoTwitterContract::class, SeoTwitter::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('packages/seo-helper')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        $this->app->register(EventServiceProvider::class);
        $this->app->register(HookServiceProvider::class);
    }
}
