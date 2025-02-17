<?php

namespace HuberwayCMS\Base\Services;

use HuberwayCMS\Base\Exceptions\FileNotWritableException;
use HuberwayCMS\Base\Facades\BaseHelper;
use Illuminate\Support\Facades\File;

class DeleteLocaleService
{
    public function handle(string $locale): void
    {
        if ($locale === 'en') {
            return;
        }

        $langPaths = [
            lang_path($locale),
            lang_path(sprintf('%s.json', $locale)),
            ...File::glob(lang_path(BaseHelper::joinPaths(['vendor', '*', '*', $locale]))),
            ...File::glob(lang_path(BaseHelper::joinPaths(['vendor', '*', '*', $locale . '.json']))),
        ];

        foreach ($langPaths as $path) {
            if (! File::exists($path)) {
                continue;
            }

            if (! File::isWritable($path)) {
                throw new FileNotWritableException(sprintf('Could not delete %s', $path));
            }

            if (File::isDirectory($path)) {
                File::deleteDirectory($path);
            } else {
                File::delete($path);
            }
        }
    }
}
