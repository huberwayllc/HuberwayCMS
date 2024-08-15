<?php

namespace HuberwayCMS\Blog\Widgets\Fronts;

use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\NumberFieldOption;
use HuberwayCMS\Base\Forms\Fields\NumberField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Blog\Models\Category;
use HuberwayCMS\Widget\AbstractWidget;
use HuberwayCMS\Widget\Forms\WidgetForm;
use Illuminate\Support\Collection;

class Categories extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Blog Categories'),
            'description' => __('Widget display blog categories'),
            'number_display' => 10,
        ]);
    }

    protected function data(): array|Collection
    {
        if (! is_plugin_active('blog')) {
            return [];
        }

        $categories = Category::query()
            ->wherePublished()
            ->with('slugable')
            ->take((int)$this->getConfig('number_display') ?? 10)
            ->get();

        return [
            'categories' => $categories,
        ];
    }

    protected function settingForm(): WidgetForm|string|null
    {
        if (! is_plugin_active('blog')) {
            return null;
        }

        return WidgetForm::createFromArray($this->getConfig())
            ->add('name', TextField::class, NameFieldOption::make()->toArray())
            ->add(
                'number_display',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(__('Number categories to display'))
                    ->toArray()
            );
    }
}
