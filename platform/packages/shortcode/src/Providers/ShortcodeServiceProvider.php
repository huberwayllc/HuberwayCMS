<?php

namespace HuberwayCMS\Shortcode\Providers;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Base\Traits\LoadAndPublishDataTrait;
use HuberwayCMS\Shortcode\Compilers\ShortcodeCompiler;
use HuberwayCMS\Shortcode\Shortcode;
use HuberwayCMS\Shortcode\View\Factory;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Blade;

class ShortcodeServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->singleton('shortcode.compiler', ShortcodeCompiler::class);

        $this->app->singleton('shortcode', function ($app) {
            return new Shortcode($app['shortcode.compiler']);
        });

        $this->app->singleton('view', function ($app) {
            // Next we need to grab the engine resolver instance that will be used by the
            // environment. The resolver will be used by an environment to get each of
            // the various engine implementations such as plain PHP or Blade engine.
            $resolver = $app['view.engine.resolver'];
            $finder = $app['view.finder'];
            $env = new Factory($resolver, $finder, $app['events'], $app['shortcode.compiler']);
            // We will also set the container instance on this view environment since the
            // view composers may be classes registered in the container, which allows
            // for great testable, flexible composers for the application developer.
            $env->setContainer($app);
            $env->share('app', $app);

            return $env;
        });

        $this->app['blade.compiler']->directive('shortcode', function ($expression) {
            return do_shortcode($expression);
        });

        $this
            ->setNamespace('packages/shortcode')
            ->loadRoutes()
            ->loadHelpers()
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->publishAssets();

        $this->app->instance('shortcode.modal.rendered', false);
    }

    public function boot(): void
    {
        add_filter(BASE_FILTER_FORM_EDITOR_BUTTONS, function (string|null $buttons, array $attributes, string $id) {
            if (! $this->hasWithShortcode($attributes)) {
                return $buttons;
            }

            $buttons = (string) $buttons;

            $buttons .= view('packages/shortcode::partials.shortcode-button', compact('id'))->render();

            return $buttons;
        }, 120, 3);

        add_filter(BASE_FILTER_FORM_EDITOR_BUTTONS_HEADER, function (string|null $header, array $attributes) {
            if (! $this->hasWithShortcode($attributes)) {
                return $header;
            }

            Assets::addStylesDirectly('vendor/core/packages/shortcode/css/shortcode.css');

            return $header;
        }, 120, 2);

        add_filter(BASE_FILTER_FORM_EDITOR_BUTTONS_FOOTER, function (string|null $footer, array $attributes) {
            if (! $this->hasWithShortcode($attributes)) {
                return $footer;
            }

            Assets::addScriptsDirectly('vendor/core/packages/shortcode/js/shortcode.js');

            $footer = (string) $footer;

            if (! $this->isShortcodeModalRendered()) {
                $footer .= view('packages/shortcode::partials.shortcode-modal')->render();

                $this->shortcodeModalRendered();
            }

            return $footer;
        }, 120, 2);
    }

    protected function hasWithShortcode(array $attributes): bool
    {
        return (bool) Arr::get($attributes, 'with-short-code', false);
    }

    protected function isShortcodeModalRendered(): bool
    {
        return $this->app['shortcode.modal.rendered'] === true;
    }

    protected function shortcodeModalRendered(): void
    {
        $this->app->instance('shortcode.modal.rendered', true);
    }
}
