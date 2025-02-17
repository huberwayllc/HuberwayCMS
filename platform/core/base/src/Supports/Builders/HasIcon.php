<?php

namespace HuberwayCMS\Base\Supports\Builders;

use Closure;

trait HasIcon
{
    protected Closure|string $icon;

    /**
     * @param \Closure(\HuberwayCMS\Base\Models\BaseModel $model): string|string $icon
     */
    public function icon(Closure|string $icon): static
    {
        $this->icon = $icon;

        return $this;
    }

    public function hasIcon(): bool
    {
        return isset($this->icon);
    }

    public function isRenderabeIcon(): bool
    {
        return $this->icon instanceof Closure;
    }

    public function getIcon(): string|null
    {
        if (! $this->hasIcon()) {
            return null;
        }

        return $this->isRenderabeIcon() ? call_user_func($this->icon, $this) : $this->icon;
    }
}
