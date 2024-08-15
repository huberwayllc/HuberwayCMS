<?php

namespace HuberwayCMS\Slug\Listeners;

use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Slug\Facades\SlugHelper;
use HuberwayCMS\Slug\Models\Slug;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        if (SlugHelper::isSupportedModel(get_class($event->data))) {
            Slug::query()->where([
                'reference_id' => $event->data->getKey(),
                'reference_type' => get_class($event->data),
            ])->delete();
        }
    }
}
