<?php

namespace HuberwayCMS\Base\Supports\Builders;

use Illuminate\Support\Arr;

trait HasAttributes
{
    protected array $attributes = [];

    public function attributes(array $attributes): static
    {
        $this->attributes = $attributes;

        return $this;
    }

    public function addAttribute(string $attribute, $value): static
    {
        $this->attributes[$attribute] = $value;

        return $this;
    }

    public function getAttributes(): array
    {
        return $this->attributes;
    }

    public function getAttribute(string $attribute, string $default = null)
    {
        return Arr::get($this->attributes, $attribute, $default);
    }
}
