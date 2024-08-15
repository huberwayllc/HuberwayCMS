<?php

namespace HuberwayCMS\Ads\Forms;

use HuberwayCMS\Ads\Facades\AdsManager;
use HuberwayCMS\Ads\Http\Requests\AdsRequest;
use HuberwayCMS\Ads\Models\Ads;
use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Forms\FormAbstract;
use Carbon\Carbon;
use Illuminate\Support\Str;

class AdsForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new Ads())
            ->setValidatorClass(AdsRequest::class)
            ->add('name', 'text', [
                'label' => trans('core/base::forms.name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('key', 'text', [
                'label' => trans('plugins/ads::ads.key'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('plugins/ads::ads.key'),
                    'data-counter' => 255,
                ],
                'default_value' => $this->generateAdsKey(),
            ])
            ->add('url', 'text', [
                'label' => trans('plugins/ads::ads.url'),
                'attr' => [
                    'placeholder' => trans('plugins/ads::ads.url'),
                    'data-counter' => 255,
                ],
            ])
            ->add('order', 'number', [
                'label' => trans('core/base::forms.order'),
                'attr' => [
                    'placeholder' => trans('core/base::forms.order_by_placeholder'),
                ],
                'default_value' => 0,
            ])
            ->add('open_in_new_tab', 'onOff', [
                'label' => trans('plugins/ads::ads.open_in_new_tab'),
                'default_value' => true,
            ])
            ->add('image', 'mediaImage')
            ->add('tablet_image', 'mediaImage', [
                'label' => __('Tablet Image'),
                'help_block' => [
                    'text' => __('For devices with width from 768px to 1200px, if empty, will use the image from the desktop.'),
                ],
            ])
            ->add('mobile_image', 'mediaImage', [
                'label' => __('Mobile Image'),
                'help_block' => [
                    'text' => __('For devices with width less than 768px, if empty, will use the image from the tablet.'),
                ],
            ])
            ->add('status', 'customSelect', [
                'label' => trans('core/base::tables.status'),
                'required' => true,
                'attr' => [
                    'class' => 'form-control select-full',
                ],
                'choices' => BaseStatusEnum::labels(),
            ])
            ->when(($adLocations = AdsManager::getLocations()) && count($adLocations) > 1, function () use ($adLocations) {
                $this->add('location', 'customSelect', [
                    'label' => trans('plugins/ads::ads.location'),
                    'required' => true,
                    'attr' => [
                        'class' => 'form-control select-full',
                    ],
                    'choices' => $adLocations,
                ]);
            })
            ->add('expired_at', 'datePicker', [
                'label' => trans('plugins/ads::ads.expired_at'),
                'default_value' => BaseHelper::formatDate(Carbon::now()->addMonth()),
            ])
            ->setBreakFieldPoint('status');
    }

    protected function generateAdsKey(): string
    {
        do {
            $key = strtoupper(Str::random(12));
        } while (Ads::query()->where('key', $key)->exists());

        return $key;
    }
}
