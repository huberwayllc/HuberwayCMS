<?php

namespace HuberwayCMS\Marketplace\Forms;

use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Marketplace\Forms\Concerns\HasSubmitButton;
use HuberwayCMS\Marketplace\Http\Requests\TaxInformationSettingRequest;
use Illuminate\Support\Arr;

class TaxInformationForm extends FormAbstract
{
    use HasSubmitButton;

    public function setup(): void
    {
        $customer = $this->getModel();

        $this
            ->setupModel(new BaseModel())
            ->setValidatorClass(TaxInformationSettingRequest::class)
            ->contentOnly()
            ->add('tax_info[business_name]', 'text', [
                'label' => __('Business Name'),
                'value' => Arr::get($customer->tax_info, 'business_name'),
                'attr' => [
                    'placeholder' => __('Business Name'),
                ],
            ])
            ->add('tax_info[tax_id]', 'text', [
                'label' => __('Tax ID'),
                'value' => Arr::get($customer->tax_info, 'tax_id'),
                'attr' => [
                    'placeholder' => __('Tax ID'),
                ],
            ])
            ->add('tax_info[address]', 'text', [
                'label' => __('Address'),
                'value' => Arr::get($customer->tax_info, 'address'),
                'attr' =>
                    ['placeholder' => __('Address'),
                ],
            ])
            ->addSubmitButton(__('Save settings'));
    }
}
