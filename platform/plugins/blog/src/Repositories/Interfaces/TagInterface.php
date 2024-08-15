<?php

namespace HuberwayCMS\Blog\Repositories\Interfaces;

use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Support\Collection;

interface TagInterface extends RepositoryInterface
{
    public function getDataSiteMap(): Collection;

    public function getPopularTags(int $limit, array $with = ['slugable'], array $withCount = ['posts']): Collection;

    public function getAllTags(bool $active = true): Collection;
}
