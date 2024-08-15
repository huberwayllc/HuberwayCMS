<?php

namespace HuberwayCMS\PluginManagement\Listeners;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\PluginManagement\PluginManifest;
use Exception;
use Illuminate\Support\Facades\File;

class ClearPluginCaches
{
    public function __construct(protected PluginManifest $manifest)
    {
    }

    public function handle(): void
    {
        try {
            if (File::isFile($pluginsPath = $this->manifest->getManifestFilePath())) {
                File::delete($pluginsPath);
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
