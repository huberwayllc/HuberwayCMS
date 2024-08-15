<?php

namespace HuberwayCMS\Table\BulkActions;

use HuberwayCMS\Base\Contracts\BaseModel as BaseModelContract;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Exceptions\DisabledInDemoModeException;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Base\Models\BaseModel;
use HuberwayCMS\Table\Abstracts\TableBulkActionAbstract;
use Illuminate\Database\Eloquent\Model;

class DeleteBulkAction extends TableBulkActionAbstract
{
    public function __construct()
    {
        $this
            ->label(trans('core/table::table.delete'))
            ->confirmationModalButton(trans('core/table::table.delete'))
            ->beforeDispatch(function () {
                if (BaseHelper::hasDemoModeEnabled()) {
                    throw new DisabledInDemoModeException();
                }
            });
    }

    public function dispatch(BaseModel|Model $model, array $ids): BaseHttpResponse
    {
        $model->newQuery()->whereKey($ids)->each(function (BaseModelContract $item) {
            $item->delete();

            DeletedContentEvent::dispatch($item::class, request(), $item);
        });

        return BaseHttpResponse::make()
            ->withDeletedSuccessMessage();
    }
}
