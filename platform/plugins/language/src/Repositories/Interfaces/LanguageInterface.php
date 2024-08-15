<?php

namespace HuberwayCMS\Language\Repositories\Interfaces;

use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Language\Models\Language;
use HuberwayCMS\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

interface LanguageInterface extends RepositoryInterface
{
    public function getActiveLanguage(array $select = ['*']): Collection;

    public function getDefaultLanguage(array $select = ['*']): BaseModel|Model|Language|null;
}
