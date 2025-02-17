<?php

namespace HuberwayCMS\Base\Forms\FieldOptions;

use HuberwayCMS\Base\Forms\FormFieldOptions;
use Closure;

class HtmlFieldOption extends FormFieldOptions
{
    protected string $html = '';

    public static function make(): static
    {
        return new static();
    }

    public function view(string $view, array $data = [], array $mergeData = []): static
    {
        return $this->content(
            view($view, $data, $mergeData)->render()
        );
    }

    public function content(string|Closure $content): static
    {
        $this->html = value($content);

        return $this;
    }

    public function toArray(): array
    {
        return [
            ...parent::toArray(),
            'html' => $this->html,
        ];
    }
}
