<?php

namespace HuberwayCMS\Base\Http\Controllers\Concerns;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;

trait HasHttpResponse
{
    public function httpResponse(): BaseHttpResponse
    {
        return BaseHttpResponse::make();
    }
}
