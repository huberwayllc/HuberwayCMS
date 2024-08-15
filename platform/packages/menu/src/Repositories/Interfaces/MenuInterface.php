<?php

namespace HuberwayCMS\Menu\Repositories\Interfaces;

use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;

interface MenuInterface extends RepositoryInterface
{
    public function findBySlug(string $slug, bool $active, array $select = [], array $with = []): BaseModel|null;

    public function createSlug(string $name): string;
}
