<?php

namespace HuberwayCMS\Revision\Providers;

use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;

class RevisionServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('packages/revision')
            ->loadAndPublishViews()
            ->loadAndPublishConfigurations(['general'])
            ->loadMigrations()
            ->publishAssets();

        $this->app->register(HookServiceProvider::class);
    }
}
