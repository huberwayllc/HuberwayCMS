<?php

namespace HuberwayCMS\Newsletter\Tables;

use HuberwayCMS\Newsletter\Models\Newsletter;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\CreatedAtBulkChange;
use HuberwayCMS\Table\BulkChanges\EmailBulkChange;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\BulkChanges\StatusBulkChange;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\EmailColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;

class NewsletterTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Newsletter::class)
            ->addColumns([
                IdColumn::make(),
                EmailColumn::make()->linkable(),
                NameColumn::make(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addActions([
                DeleteAction::make()->route('newsletter.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('newsletter.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                EmailBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'email',
                        'name',
                        'created_at',
                        'status',
                    ]);
            });
    }

    public function getDefaultButtons(): array
    {
        return [
            'export',
            'reload',
        ];
    }
}
