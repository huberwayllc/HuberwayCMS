<?php

namespace HuberwayCMS\SimpleSlider\Providers;

use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Shortcode\Compilers\Shortcode;
use HuberwayCMS\Shortcode\Forms\ShortcodeForm;
use HuberwayCMS\SimpleSlider\Models\SimpleSlider;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (function_exists('shortcode')) {
            add_shortcode(
                'simple-slider',
                trans('plugins/simple-slider::simple-slider.simple_slider_shortcode_name'),
                trans('plugins/simple-slider::simple-slider.simple_slider_shortcode_description'),
                [$this, 'render']
            );

            shortcode()->setPreviewImage(
                'simple-slider',
                asset('vendor/core/plugins/simple-slider/images/ui-blocks/simple-slider.png')
            );

            shortcode()->setAdminConfig('simple-slider', function (array $attributes) {
                return ShortcodeForm::createFromArray($attributes)
                    ->add(
                        'key',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(trans('plugins/simple-slider::simple-slider.select_slider'))
                            ->choices(SimpleSlider::query()
                                ->wherePublished()
                                ->pluck('name', 'key')
                                ->all())
                            ->toArray()
                    );
            });
        }
    }

    public function render(Shortcode $shortcode): View|Factory|Application|null
    {
        $slider = SimpleSlider::query()
            ->wherePublished()
            ->where('key', $shortcode->key)
            ->first();

        if (empty($slider)) {
            return null;
        }

        if (setting('simple_slider_using_assets', true) && defined('THEME_OPTIONS_MODULE_SCREEN_NAME')) {
            $version = '1.0.2';
            $dist = asset('vendor/core/plugins/simple-slider');

            Theme::asset()
                ->container('footer')
                ->usePath(false)
                ->add(
                    'simple-slider-owl-carousel-css',
                    $dist . '/libraries/owl-carousel/owl.carousel.css',
                    [],
                    [],
                    $version
                )
                ->add('simple-slider-css', $dist . '/css/simple-slider.css', [], [], $version)
                ->add(
                    'simple-slider-owl-carousel-js',
                    $dist . '/libraries/owl-carousel/owl.carousel.js',
                    ['jquery'],
                    [],
                    $version
                )
                ->add('simple-slider-js', $dist . '/js/simple-slider.js', ['jquery'], [], $version);
        }

        return view(apply_filters(SIMPLE_SLIDER_VIEW_TEMPLATE, 'plugins/simple-slider::sliders'), [
            'sliders' => $slider->sliderItems,
            'shortcode' => $shortcode,
            'slider' => $slider,
        ]);
    }
}
