<?php

namespace HuberwayCMS\Ecommerce\Forms\Fronts;

use HuberwayCMS\Base\Forms\FieldOptions\TextFieldOption;
use HuberwayCMS\Base\Forms\Fields\TextField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Facades\EcommerceHelper;
use HuberwayCMS\Ecommerce\Http\Requests\Fronts\OrderTrackingRequest;

class OrderTrackingForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->contentOnly()
            ->setMethod('GET')
            ->setValidatorClass(OrderTrackingRequest::class)
            ->setUrl(route('public.orders.tracking'))
            ->add(
                'order_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Order ID'))
                    ->required()
                    ->placeholder(__('Enter the order ID'))
                    ->toArray()
            )
            ->when(EcommerceHelper::isLoginUsingPhone(), function (FormAbstract $form) {
                $form->add(
                    'phone',
                    'tel',
                    TextFieldOption::make()
                        ->label(__('Phone number'))
                        ->placeholder(__('Enter your phone number'))
                        ->required()
                        ->toArray()
                );
            }, function (FormAbstract $form) {
                $form->add(
                    'email',
                    TextField::class,
                    TextFieldOption::make()
                        ->label(__('Email'))
                        ->required()
                        ->placeholder(__('Enter your email'))
                        ->toArray()
                );
            })
            ->add('submit', 'button', [
                'label' => __('Track'),
                'attr' => [
                    'type' => 'submit',
                    'class' => 'w-100 btn btn-primary',
                ],
            ]);
    }
}
