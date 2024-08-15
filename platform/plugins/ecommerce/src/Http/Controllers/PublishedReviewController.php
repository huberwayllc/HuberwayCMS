<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Enums\BaseStatusEnum;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Models\Review;

class PublishedReviewController extends BaseController
{
    public function store(string|int $id)
    {
        $review = Review::query()
            ->whereIn('status', [BaseStatusEnum::DRAFT, BaseStatusEnum::PENDING])
            ->findOrFail($id);

        $review->update(['status' => BaseStatusEnum::PUBLISHED]);

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::review.published_success'));
    }

    public function destroy(string|int $id)
    {
        $review = Review::query()
            ->wherePublished()
            ->findOrFail($id);

        $review->update(['status' => BaseStatusEnum::DRAFT]);

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::review.unpublished_success'));
    }
}
