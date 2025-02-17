<?php

namespace HuberwayCMS\Base\Forms\FieldOptions;

use HuberwayCMS\Base\Forms\FormFieldOptions;
use Illuminate\Support\Collection;

class SelectFieldOption extends FormFieldOptions
{
    protected array|Collection $choices = [];

    protected array|string|bool|null $selected;

    protected bool $searchable = false;

    protected bool $multiple = false;

    protected string $emptyValue;

    public function choices(array|Collection $choices): static
    {
        $this->choices = $choices;

        return $this;
    }

    public function getChoices(): array|Collection
    {
        return $this->choices;
    }

    public function selected(array|string|bool|null $selected): static
    {
        $this->selected = $selected;

        return $this;
    }

    public function getSelected(): array|string|bool|null
    {
        return $this->selected;
    }

    public function searchable(bool $searchable = true): static
    {
        $this->searchable = $searchable;

        if ($searchable) {
            if ($this->multiple) {
                $this->addAttribute('class', 'select-multiple');
            } else {
                $this->addAttribute('class', 'select-search-full');
            }
        }

        return $this;
    }

    public function ajaxSearch(): static
    {
        $this->addAttribute('class', 'select-search-ajax');

        return $this;
    }

    public function ajaxUrl(string $url): static
    {
        $this->addAttribute('data-url', $url);

        return $this;
    }

    public function multiple(bool $multiple = true): static
    {
        $this->multiple = $multiple;

        if ($multiple) {
            $this->addAttribute('multiple', true);

            if ($this->searchable) {
                $this->addAttribute('class', 'select-multiple');
            }
        }

        return $this;
    }

    public function emptyValue(string $value): static
    {
        $this->emptyValue = $value;

        return $this;
    }

    public function getEmptyValue(): string
    {
        return $this->emptyValue;
    }

    public function toArray(): array
    {
        $data = parent::toArray();

        $data['choices'] = $this->getChoices();

        if (isset($this->selected)) {
            $data['selected'] = $this->getSelected();
        }

        if (isset($this->emptyValue)) {
            $data['attr']['placeholder'] = $this->getEmptyValue();
        }

        return $data;
    }
}
