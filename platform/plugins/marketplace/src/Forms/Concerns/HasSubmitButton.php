<?php

namespace HuberwayCMS\Marketplace\Forms\Concerns;

use HuberwayCMS\Base\Facades\BaseHelper;

trait HasSubmitButton
{
    public function addSubmitButton(string $label, string|null $icon = null, array $attributes = []): static
    {
        $this->add('submit', 'submit', [
            'label' => ($icon ? BaseHelper::renderIcon($icon) . ' ' : '') . $label,
            'attr' => [
                'class' => 'btn btn-primary',
            ],
            ...$attributes,
        ]);

        return $this;
    }
}
