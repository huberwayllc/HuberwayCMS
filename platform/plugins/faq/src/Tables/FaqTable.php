<?php

namespace HuberwayCMS\Faq\Tables;

use HuberwayCMS\Faq\Models\Faq;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\CreatedAtBulkChange;
use HuberwayCMS\Table\BulkChanges\TextBulkChange;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\FormattedColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\LinkableColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class FaqTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Faq::class)
            ->addColumns([
                IdColumn::make(),
                LinkableColumn::make('question')
                    ->title(trans('plugins/faq::faq.question'))
                    ->route('faq.edit')
                    ->alignStart(),
                FormattedColumn::make('category_id')
                    ->title(trans('plugins/faq::faq.category'))
                    ->alignStart()
                    ->getValueUsing(fn (FormattedColumn $column) => $column->getItem()->category->name),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('faq.create'))
            ->addActions([
                EditAction::make()->route('faq.edit'),
                DeleteAction::make()->route('faq.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('faq.destroy'))
            ->addBulkChanges([
                TextBulkChange::make()
                    ->name('question')
                    ->title(trans('plugins/faq::faq.question')),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'question',
                        'created_at',
                        'answer',
                        'category_id',
                        'status',
                    ]);
            });
    }
}
