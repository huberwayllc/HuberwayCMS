<?php

namespace HuberwayCMS\Faq\Tables;

use HuberwayCMS\Faq\Models\FaqCategory;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\CreatedAtBulkChange;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\BulkChanges\StatusBulkChange;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class FaqCategoryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(FaqCategory::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('faq_category.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('faq_category.create'))
            ->addActions([
                EditAction::make()->route('faq_category.edit'),
                DeleteAction::make()->route('faq_category.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('faq_category.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'created_at',
                        'status',
                    ]);
            });
    }
}
