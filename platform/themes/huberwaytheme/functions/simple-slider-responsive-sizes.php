<?php

use HuberwayCMS\SimpleSlider\Support\SimpleSliderSupport;

app()->booted(function () {
    if (is_plugin_active('simple-slider')) {
        SimpleSliderSupport::registerResponsiveImageSizes();
    }
});
