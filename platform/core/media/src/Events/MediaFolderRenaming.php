<?php

namespace HuberwayCMS\Media\Events;

use HuberwayCMS\Media\Models\MediaFolder;
use Illuminate\Foundation\Events\Dispatchable;

class MediaFolderRenaming
{
    use Dispatchable;

    public function __construct(public MediaFolder $file, public string $newName, public bool $renameOnDisk)
    {
    }
}
