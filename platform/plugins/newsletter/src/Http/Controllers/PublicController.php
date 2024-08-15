<?php

namespace HuberwayCMS\Newsletter\Http\Controllers;

use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Newsletter\Enums\NewsletterStatusEnum;
use HuberwayCMS\Newsletter\Events\SubscribeNewsletterEvent;
use HuberwayCMS\Newsletter\Events\UnsubscribeNewsletterEvent;
use HuberwayCMS\Newsletter\Http\Requests\NewsletterRequest;
use HuberwayCMS\Newsletter\Models\Newsletter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class PublicController extends BaseController
{
    public function postSubscribe(NewsletterRequest $request)
    {
        /**
         * @var Newsletter $newsletter
         */
        $newsletter = Newsletter::query()->firstOrNew(['email' => $request->input('email')], $request->validated());

        $newsletter->status = NewsletterStatusEnum::SUBSCRIBED;
        $newsletter->save();

        event(new SubscribeNewsletterEvent($newsletter));

        return $this
            ->httpResponse()
            ->setMessage(__('Subscribe to newsletter successfully!'));
    }

    public function getUnsubscribe(int|string $id, Request $request)
    {
        if (! URL::hasValidSignature($request)) {
            abort(404);
        }

        /**
         * @var Newsletter $newsletter
         */
        $newsletter = Newsletter::query()
            ->where([
                'id' => $id,
                'status' => NewsletterStatusEnum::SUBSCRIBED,
            ])
            ->first();

        if ($newsletter) {
            $newsletter->status = NewsletterStatusEnum::UNSUBSCRIBED;
            $newsletter->save();

            event(new UnsubscribeNewsletterEvent($newsletter));

            return $this
                ->httpResponse()
                ->setNextRoute('public.index')
                ->setMessage(__('Unsubscribe to newsletter successfully'));
        }

        return $this
            ->httpResponse()
            ->setError()
            ->setNextRoute('public.index')
            ->setMessage(__('Your email does not exist in the system or you have unsubscribed already!'));
    }
}
