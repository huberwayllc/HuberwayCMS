<?php

namespace HuberwayCMS\Menu\Forms;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Menu\Http\Requests\MenuRequest;
use HuberwayCMS\Menu\Models\Menu;

class MenuForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addStyles('jquery-nestable')
            ->addScripts('jquery-nestable')
            ->addScriptsDirectly('vendor/core/packages/menu/js/menu.js')
            ->addStylesDirectly('vendor/core/packages/menu/css/menu.css');

        $this
            ->model(Menu::class)
            ->setFormOption('class', 'form-save-menu')
            ->setValidatorClass(MenuRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required()->maxLength(120)->toArray())
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->addMetaBoxes([
                'structure' => [
                    'wrap' => false,
                    'content' => function () {
                        return view('packages/menu::menu-structure', [
                            'menu' => $this->getModel(),
                            'locations' => $this->getModel()->getKey() ? $this->getModel()->locations()->pluck('location')->all() : [],
                        ])->render();
                    },
                ],
            ])
            ->setBreakFieldPoint('status');
    }
}
