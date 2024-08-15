<?php

namespace HuberwayCMS\Ecommerce\Repositories\Eloquent;

use HuberwayCMS\Ecommerce\Repositories\Interfaces\CurrencyInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class CurrencyRepository extends RepositoriesAbstract implements CurrencyInterface
{
    public function getAllCurrencies(): Collection
    {
        $data = $this->model
            ->orderBy('order');

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
