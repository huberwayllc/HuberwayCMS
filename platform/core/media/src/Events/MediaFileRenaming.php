<?php

namespace HuberwayCMS\Media\Events;

use HuberwayCMS\Media\Models\MediaFile;
use Illuminate\Foundation\Events\Dispatchable;

class MediaFileRenaming
{
    use Dispatchable;

    public function __construct(public MediaFile $file, public string $newName, public bool $renameOnDisk)
    {
    }
}
