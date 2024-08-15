<?php

namespace HuberwayCMS\Faq\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\EditorFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\TextareaFieldOption;
use HuberwayCMS\Base\Forms\Fields\EditorField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextareaField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Faq\Http\Requests\FaqRequest;
use HuberwayCMS\Faq\Models\Faq;
use HuberwayCMS\Faq\Models\FaqCategory;

class FaqForm extends FormAbstract
{
    public function setup(): void
    {
        $faqCategories = FaqCategory::query()
            ->pluck(
                'name',
                'id'
            )
            ->all();

        $this
            ->model(Faq::class)
            ->setValidatorClass(FaqRequest::class)
            ->add(
                'category_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/faq::faq.category'))
                    ->choices(['' => trans('plugins/faq::faq.select_category')] + $faqCategories)
                    ->required()
                    ->toArray()
            )
            ->add(
                'question',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/faq::faq.question'))
                    ->required()
                    ->rows(4)
                    ->toArray()
            )
            ->add(
                'answer',
                EditorField::class,
                EditorFieldOption::make()->label(trans('plugins/faq::faq.answer'))->required()->rows(4)->toArray()
            )
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->setBreakFieldPoint('status');
    }
}
