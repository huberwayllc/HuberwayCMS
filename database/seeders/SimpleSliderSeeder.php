<?php

namespace Database\Seeders;

use HuberwayCMS\Base\Facades\MetaBox;
use HuberwayCMS\Base\Supports\BaseSeeder;
use HuberwayCMS\Language\Models\LanguageMeta;
use HuberwayCMS\Setting\Models\Setting;
use HuberwayCMS\SimpleSlider\Models\SimpleSlider;
use HuberwayCMS\SimpleSlider\Models\SimpleSliderItem;

class SimpleSliderSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('sliders');

        SimpleSlider::query()->truncate();
        SimpleSliderItem::query()->truncate();

        $sliders = [
            [
                'name' => 'Home slider',
                'key' => 'home-slider',
                'description' => 'The main slider on homepage',
            ],
        ];

        $sliderItems = [
            [
                'title' => 'Slider 1',
            ],
            [
                'title' => 'Slider 2',
            ],
            [
                'title' => 'Slider 3',
            ],
        ];

        foreach ($sliders as $value) {
            $slider = SimpleSlider::query()->create($value);

            LanguageMeta::saveMetaData($slider);

            foreach ($sliderItems as $key => $item) {
                $item['link'] = '/products';
                $item['image'] = 'sliders/' . ($key + 1) . '-lg.jpg';
                $item['order'] = $key + 1;
                $item['simple_slider_id'] = $slider->id;

                $ssItem = SimpleSliderItem::query()->create($item);

                MetaBox::saveMetaBoxData($ssItem, 'tablet_image', 'sliders/' . ($key + 1) . '-md.jpg');
                MetaBox::saveMetaBoxData($ssItem, 'mobile_image', 'sliders/' . ($key + 1) . '-sm.jpg');
            }
        }

        Setting::query()->insertOrIgnore([
            [
                'key' => 'simple_slider_using_assets',
                'value' => 0,
            ],
        ]);
    }
}
