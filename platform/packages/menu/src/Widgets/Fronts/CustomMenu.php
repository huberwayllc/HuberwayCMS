<?php

namespace HuberwayCMS\Menu\Widgets\Fronts;

use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Menu\Models\Menu;
use HuberwayCMS\Widget\AbstractWidget;
use HuberwayCMS\Widget\Forms\WidgetForm;

class CustomMenu extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('Custom Menu'),
            'description' => __('Add a custom menu to your widget area.'),
            'menu_id' => null,
        ]);
    }

    protected function settingForm(): WidgetForm|string|null
    {
        return WidgetForm::createFromArray($this->getConfig())
            ->add('name', TextField::class, NameFieldOption::make()->toArray())
            ->add(
                'menu_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Menu'))
                    ->choices(Menu::query()->pluck('name', 'slug')->all())
                    ->searchable()
                    ->toArray()
            );
    }
}
