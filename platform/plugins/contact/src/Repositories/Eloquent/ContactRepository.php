<?php

namespace HuberwayCMS\Contact\Repositories\Eloquent;

use HuberwayCMS\Contact\Enums\ContactStatusEnum;
use HuberwayCMS\Contact\Repositories\Interfaces\ContactInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class ContactRepository extends RepositoriesAbstract implements ContactInterface
{
    public function getUnread(array $select = ['*']): Collection
    {
        $data = $this->model
            ->where('status', ContactStatusEnum::UNREAD)
            ->select($select)
            ->orderByDesc('created_at')
            ->get();

        $this->resetModel();

        return $data;
    }

    public function countUnread(): int
    {
        $data = $this->model->where('status', ContactStatusEnum::UNREAD)->count();
        $this->resetModel();

        return $data;
    }
}
