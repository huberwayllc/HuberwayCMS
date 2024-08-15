<?php

namespace HuberwayCMS\Faq\Listeners;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\MetaBox;
use HuberwayCMS\Faq\FaqSupport;

class SaveFaqListener
{
    public function handle(CreatedContentEvent|UpdatedContentEvent $event): void
    {
        if (! setting('enable_faq_schema')) {
            return;
        }

        $request = $event->request;
        $model = $event->data;

        if (! is_object($model) || ! in_array($model::class, config('plugins.faq.general.schema_supported', []))) {
            return;
        }

        if ($request->has('content') && $request->has('faq_schema_config')) {
            (new FaqSupport())->saveConfigs($model, $request->input('faq_schema_config'));
        }

        MetaBox::saveMetaBoxData($model, 'faq_ids', $request->input('selected_existing_faqs', []));
    }
}
