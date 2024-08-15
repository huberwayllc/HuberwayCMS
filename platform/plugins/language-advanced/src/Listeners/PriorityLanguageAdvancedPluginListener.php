<?php

namespace HuberwayCMS\LanguageAdvanced\Listeners;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\LanguageAdvanced\Plugin;
use Exception;

class PriorityLanguageAdvancedPluginListener
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
