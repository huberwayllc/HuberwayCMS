<?php

namespace HuberwayCMS\Language\Repositories\Eloquent;

use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Language\Models\Language;
use HuberwayCMS\Language\Repositories\Interfaces\LanguageInterface;
use HuberwayCMS\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class LanguageRepository extends RepositoriesAbstract implements LanguageInterface
{
    public function getActiveLanguage(array $select = ['*']): Collection
    {
        $data = $this->model->orderBy('lang_order')->select($select)->get();
        $this->resetModel();

        return $data;
    }

    public function getDefaultLanguage(array $select = ['*']): BaseModel|Model|Language|null
    {
        $data = $this->model->where('lang_is_default', 1)->select($select)->first();
        $this->resetModel();

        return $data;
    }
}
