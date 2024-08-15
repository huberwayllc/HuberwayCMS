<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\StatusFieldOption;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Http\Requests\TaxRequest;
use HuberwayCMS\Ecommerce\Models\Tax;
use HuberwayCMS\Ecommerce\Tables\TaxRuleTable;

class TaxForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new Tax())
            ->setValidatorClass(TaxRequest::class)
            ->add('title', 'text', [
                'label' => trans('plugins/ecommerce::tax.title'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/ecommerce::tax.title'),
                    'data-counter' => 120,
                ],
            ])
            ->add('percentage', 'number', [
                'label' => trans('plugins/ecommerce::tax.percentage'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/ecommerce::tax.percentage'),
                    'data-counter' => 120,
                ],
            ])
            ->add('priority', 'number', [
                'label' => trans('plugins/ecommerce::tax.priority'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/ecommerce::tax.priority'),
                    'data-counter' => 120,
                ],
            ])
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->setBreakFieldPoint('status')
            ->when(
                $this->getModel()->id,
                fn (FormAbstract $form) => $form->addMetaBoxes([
                    'tax_rules' => [
                        'title' => trans('plugins/ecommerce::tax.rule.name'),
                        'content' => app(TaxRuleTable::class)
                            ->setView('core/table::base-table')
                            ->setAjaxUrl(route('tax.rule.index', $this->getModel()->getKey() ?: 0))->renderTable(),
                        'has_table' => true,
                        'wrap' => true,
                    ],
                ])
            );
    }
}
