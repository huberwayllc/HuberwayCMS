<?php

namespace HuberwayCMS\Base\Traits\Forms;

use HuberwayCMS\Base\Forms\FormCollapse;

trait HasCollapsible
{
    public function addCollapsible(FormCollapse $form): static
    {
        $form->build($this);

        return $this;
    }
}
