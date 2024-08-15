<?php

namespace HuberwayCMS\Ecommerce\Repositories\Eloquent;

use HuberwayCMS\Ecommerce\Repositories\Interfaces\BrandInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class BrandRepository extends RepositoriesAbstract implements BrandInterface
{
    public function getAll(array $condition = []): Collection
    {
        $data = $this->model
            ->where($condition)
            ->orderByDesc('is_featured')
            ->orderBy('name');

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
