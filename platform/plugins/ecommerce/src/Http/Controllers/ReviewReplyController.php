<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Http\Requests\ReviewReplyRequest;
use HuberwayCMS\Ecommerce\Models\Review;
use HuberwayCMS\Ecommerce\Models\ReviewReply;

class ReviewReplyController extends BaseController
{
    public function store(Review $review, ReviewReplyRequest $request)
    {
        $userId = $request->user()->id;

        if (
            ReviewReply::query()
                ->where('review_id', $review->getKey())
                ->where('user_id', $userId)
                ->exists()
        ) {
            return $this
                ->httpResponse()
                ->setMessage(trans('plugins/ecommerce::review.already_replied'))
                ->setError();
        }

        $review->reply()->create([
            'user_id' => $request->user()->id,
            'message' => $request->input('message'),
        ]);

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::review.replied_success_message'));
    }

    public function update(Review $review, ReviewReply $reply, ReviewReplyRequest $request)
    {
        if ($reply->review()->isNot($review)) {
            abort(404);
        }

        $reply->update([
            'message' => $request->input('message'),
        ]);

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Review $review, ReviewReply $reply)
    {
        return DeleteResourceAction::make($reply);
    }
}
