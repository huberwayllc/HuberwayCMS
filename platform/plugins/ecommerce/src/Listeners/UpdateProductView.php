<?php

namespace HuberwayCMS\Ecommerce\Listeners;

use HuberwayCMS\Ecommerce\Events\ProductViewed;
use HuberwayCMS\Ecommerce\Models\ProductView;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\DB;
use Throwable;

class UpdateProductView implements ShouldQueue
{
    use InteractsWithQueue;

    public function handle(ProductViewed $event): void
    {
        try {
            ProductView::query()
                ->upsert(
                    [
                        'product_id' => $event->product->getKey(),
                        'date' => $event->dateTime->toDateString(),
                        'views' => 1,
                    ],
                    ['product_id', 'date'],
                    ['views' => DB::raw('views + 1')],
                );
        } catch (Throwable $exception) {
            info($exception->getMessage());
        }
    }
}
