<?php

namespace HuberwayCMS\Widget\Forms;

use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Base\Models\BaseModel;

class WidgetForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(BaseModel::class)
            ->contentOnly();
    }

    public function renderForm(array $options = [], $showStart = false, $showFields = true, $showEnd = false): string
    {
        return parent::renderForm($options, $showStart, $showFields, $showEnd);
    }
}
