<?php

namespace HuberwayCMS\SimpleSlider\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\DescriptionFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\TextFieldOption;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextareaField;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\SimpleSlider\Http\Requests\SimpleSliderRequest;
use HuberwayCMS\SimpleSlider\Models\SimpleSlider;
use HuberwayCMS\SimpleSlider\Tables\SimpleSliderItemTable;
use HuberwayCMS\Table\TableBuilder;

class SimpleSliderForm extends FormAbstract
{
    public function __construct(protected TableBuilder $tableBuilder)
    {
        parent::__construct();
    }

    public function setup(): void
    {
        $this
            ->model(SimpleSlider::class)
            ->setValidatorClass(SimpleSliderRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required()->toArray())
            ->add(
                'key',
                TextField::class,
                TextFieldOption::make()
                ->label(trans('plugins/simple-slider::simple-slider.key'))
                ->required()
                ->maxLength(120)
                ->toArray()
            )
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->setBreakFieldPoint('status')
            ->when($this->model->id, function () {
                $this->addMetaBoxes([
                    'slider-items' => [
                        'title' => trans('plugins/simple-slider::simple-slider.slide_items'),
                        'content' => $this->tableBuilder->create(SimpleSliderItemTable::class)
                            ->setAjaxUrl(route(
                                'simple-slider-item.index',
                                $this->getModel()->id ?: 0
                            ))
                            ->renderTable([
                                'simple_slider_id' => $this->getModel()->getKey(),
                            ]),
                        'header_actions' => view('plugins/simple-slider::partials.header-actions', [
                            'slider' => $this->getModel(),
                        ])->render(),
                        'has_table' => true,
                    ],
                ]);
            });
    }
}
