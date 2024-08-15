<?php

namespace HuberwayCMS\Shortcode\Forms;

use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Shortcode\Forms\Fields\ShortcodeTabsField;

class ShortcodeForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(BaseModel::class)
            ->contentOnly()
            ->addCustomField('tabs', ShortcodeTabsField::class);
    }

    public function renderForm(array $options = [], $showStart = false, $showFields = true, $showEnd = false): string
    {
        return parent::renderForm($options, $showStart, $showFields, $showEnd);
    }
}
