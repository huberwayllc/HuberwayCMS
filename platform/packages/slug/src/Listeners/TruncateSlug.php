<?php

namespace HuberwayCMS\Slug\Listeners;

use HuberwayCMS\Slug\Models\Slug;

class TruncateSlug
{
    public function handle(): void
    {
        Slug::query()->truncate();
    }
}
