<?php

namespace HuberwayCMS\Optimize\Providers;

use HuberwayCMS\Base\Facades\PanelSectionManager;
use HuberwayCMS\Base\PanelSections\PanelSectionItem;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Optimize\Facades\OptimizerHelper;
use HuberwayCMS\Optimize\Http\Middleware\CollapseWhitespace;
use HuberwayCMS\Optimize\Http\Middleware\DeferJavascript;
use HuberwayCMS\Optimize\Http\Middleware\ElideAttributes;
use HuberwayCMS\Optimize\Http\Middleware\InlineCss;
use HuberwayCMS\Optimize\Http\Middleware\InsertDNSPrefetch;
use HuberwayCMS\Optimize\Http\Middleware\RemoveComments;
use HuberwayCMS\Optimize\Http\Middleware\RemoveQuotes;
use HuberwayCMS\Setting\PanelSections\SettingCommonPanelSection;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Routing\Router;

class OptimizeServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('packages/optimize')
            ->loadAndPublishConfigurations(['general', 'permissions'])
            ->loadRoutes()
            ->loadAndPublishTranslations()
            ->loadAndPublishViews();

        if (! class_exists('OptimizerHelper')) {
            AliasLoader::getInstance()->alias('OptimizerHelper', OptimizerHelper::class);
        }

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingCommonPanelSection::class,
                fn () => PanelSectionItem::make('common')
                    ->setTitle(trans('packages/optimize::optimize.settings.title'))
                    ->withIcon('ti ti-brand-speedtest')
                    ->withPriority(140)
                    ->withDescription(trans('packages/optimize::optimize.settings.description'))
                    ->withRoute('optimize.settings')
            );
        });

        $this->app['events']->listen(RouteMatched::class, function () {
            if (OptimizerHelper::isEnabled()) {
                /**
                 * @var Router $router
                 */
                $router = $this->app['router'];

                if (setting('optimize_elide_attributes', 0)) {
                    $router->pushMiddlewareToGroup('web', ElideAttributes::class);
                }

                if (setting('optimize_inline_css', 0)) {
                    $router->pushMiddlewareToGroup('web', InlineCss::class);
                }

                if (setting('optimize_insert_dns_prefetch', 0)) {
                    $router->pushMiddlewareToGroup('web', InsertDNSPrefetch::class);
                }

                if (setting('optimize_collapse_white_space', 0)) {
                    $router->pushMiddlewareToGroup('web', CollapseWhitespace::class);
                }

                if (setting('optimize_remove_comments', 0)) {
                    $router->pushMiddlewareToGroup('web', RemoveComments::class);
                }

                if (setting('optimize_remove_quotes', 0)) {
                    $router->pushMiddlewareToGroup('web', RemoveQuotes::class);
                }

                if (setting('optimize_defer_javascript', 0)) {
                    $router->pushMiddlewareToGroup('web', DeferJavascript::class);
                }
            }
        });
    }
}
