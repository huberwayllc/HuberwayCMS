<?php

namespace HuberwayCMS\Ecommerce\Services\Footprints;

use Illuminate\Http\Request;

interface TrackingFilterInterface
{
    public function shouldTrack(Request $request): bool;
}
