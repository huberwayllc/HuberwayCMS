<?php

use HuberwayCMS\Theme\Facades\Theme;

app()->booted(fn () => Theme::registerFacebookIntegration());
