<?php

namespace HuberwayCMS\Ads\Repositories\Eloquent;

use HuberwayCMS\Ads\Repositories\Interfaces\AdsInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class AdsRepository extends RepositoriesAbstract implements AdsInterface
{
    public function getAll(): Collection
    {
        // @phpstan-ignore-next-line
        $data = $this->model
            ->wherePublished()
            ->notExpired()
            ->with(['metadata']);

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
