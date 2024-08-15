<?php

namespace HuberwayCMS\Ecommerce\Http\Middleware;

use HuberwayCMS\Ecommerce\Services\Footprints\TrackingFilterInterface;

use HuberwayCMS\Ecommerce\Services\Footprints\TrackingLoggerInterface;
use Closure;
use Illuminate\Http\Request;

class CaptureFootprintsMiddleware
{
    public function __construct(protected TrackingFilterInterface $filter, protected TrackingLoggerInterface $logger)
    {
    }

    public function handle(Request $request, Closure $next)
    {
        if ($this->filter->shouldTrack($request)) {
            $request = $this->logger->track($request);
        }

        return $next($request);
    }
}
