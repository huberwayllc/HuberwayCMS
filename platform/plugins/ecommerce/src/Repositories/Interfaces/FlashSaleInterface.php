<?php

namespace HuberwayCMS\Ecommerce\Repositories\Interfaces;

use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface FlashSaleInterface extends RepositoryInterface
{
    public function getAvailableFlashSales(array $with = []): Collection;
}
