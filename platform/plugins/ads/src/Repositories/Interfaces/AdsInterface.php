<?php

namespace HuberwayCMS\Ads\Repositories\Interfaces;

use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface AdsInterface extends RepositoryInterface
{
    public function getAll(): Collection;
}
