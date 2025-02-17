<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Facades\Assets;
use HuberwayCMS\Base\Forms\FieldOptions\NameFieldOption;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Enums\GlobalOptionEnum;
use HuberwayCMS\Ecommerce\Http\Requests\GlobalOptionRequest;
use HuberwayCMS\Ecommerce\Models\GlobalOption;

class GlobalOptionForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScripts(['jquery-ui'])->addScriptsDirectly([
            'vendor/core/plugins/ecommerce/js/global-option.js',
        ]);

        $this
            ->setupModel(new GlobalOption())
            ->setValidatorClass(GlobalOptionRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->toArray())
            ->add('option_type', 'customSelect', [
                'label' => trans('plugins/ecommerce::product-option.option_type'),
                'required' => true,
                'attr' => ['class' => 'form-control option-type'],
                'choices' => GlobalOptionEnum::options(),
            ])
            ->add('required', 'onOff', [
                'label' => trans('plugins/ecommerce::product-option.required'),
                'default_value' => false,
            ])
            ->setBreakFieldPoint('option_type')
            ->addMetaBoxes([
                'product_options_box' => [
                    'id' => 'product_options_box',
                    'title' => trans('plugins/ecommerce::product-option.option_value'),
                    'content' => view(
                        'plugins/ecommerce::product-options.option-admin',
                        ['values' => $this->model->values->sortBy('order')]
                    )->render(),
                ],
            ]);
    }
}
