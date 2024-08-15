<?php

namespace HuberwayCMS\Ecommerce\Forms;

use HuberwayCMS\Base\Forms\FieldOptions\DatePickerFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\SelectFieldOption;
use HuberwayCMS\Base\Forms\FieldOptions\TextareaFieldOption;
use HuberwayCMS\Base\Forms\Fields\DatetimeField;
use HuberwayCMS\Base\Forms\Fields\MediaImagesField;
use HuberwayCMS\Base\Forms\Fields\SelectField;
use HuberwayCMS\Base\Forms\Fields\TextareaField;
use HuberwayCMS\Base\Forms\FormAbstract;
use HuberwayCMS\Ecommerce\Http\Requests\ReviewRequest;
use HuberwayCMS\Ecommerce\Models\Review;
use Carbon\Carbon;

class ReviewForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setupModel(new Review())
            ->setValidatorClass(ReviewRequest::class)
            ->add(
                'product_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.product'))
                    ->ajaxSearch()
                    ->required()
                    ->ajaxUrl(route('reviews.ajax-search-products'))
                    ->toArray()
            )
            ->add(
                'customer_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.customer'))
                    ->ajaxSearch()
                    ->required()
                    ->ajaxUrl(route('reviews.ajax-search-customers'))
                    ->toArray()
            )
            ->add(
                'star',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.star'))
                    ->choices(array_combine(range(1, 5), range(1, 5)))
                    ->selected(5)
                    ->toArray()
            )
            ->add(
                'comment',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/ecommerce::review.comment'))
                    ->required()
                    ->toArray()
            )
            ->add('images[]', MediaImagesField::class, [
                'label' => trans('plugins/ecommerce::review.images'),
                'values' => $this->model->images,
            ])
            ->add(
                'created_at',
                DatetimeField::class,
                DatePickerFieldOption::make()
                    ->label(trans('core/base::tables.created_at'))
                    ->value(Carbon::now())
                    ->toArray()
            )
            ->setBreakFieldPoint('created_at');
    }
}
