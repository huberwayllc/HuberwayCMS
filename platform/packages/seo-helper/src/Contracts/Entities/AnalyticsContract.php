<?php

namespace HuberwayCMS\SeoHelper\Contracts\Entities;

use HuberwayCMS\SeoHelper\Contracts\RenderableContract;

interface AnalyticsContract extends RenderableContract
{
    /**
     * Set Google Analytics code.
     *
     * @param string $code
     * @return $this
     */
    public function setGoogle($code);
}
