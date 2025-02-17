<?php

namespace HuberwayCMS\Ecommerce\Repositories\Eloquent;

use HuberwayCMS\Ecommerce\Repositories\Interfaces\FlashSaleInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class FlashSaleRepository extends RepositoriesAbstract implements FlashSaleInterface
{
    public function getAvailableFlashSales(array $with = []): Collection
    {
        $data = $this->model
            ->notExpired()
            ->wherePublished()
            ->latest();

        if ($with) {
            $data = $data->with($with);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
