<?php

namespace HuberwayCMS\Language\Listeners;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Language\Plugin;
use Exception;

class ActivatedPluginListener
{
    public function handle(): void
    {
        try {
            Plugin::activated();
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
