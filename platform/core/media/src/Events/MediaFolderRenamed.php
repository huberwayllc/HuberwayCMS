<?php

namespace HuberwayCMS\Media\Events;

use HuberwayCMS\Media\Models\MediaFolder;
use Illuminate\Foundation\Events\Dispatchable;

class MediaFolderRenamed
{
    use Dispatchable;

    public function __construct(public MediaFolder $folder)
    {
    }
}
