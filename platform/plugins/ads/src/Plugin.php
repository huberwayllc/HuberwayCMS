<?php

namespace HuberwayCMS\Ads;

use HuberwayCMS\PluginManagement\Abstracts\PluginOperationAbstract;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('ads');
    }
}
