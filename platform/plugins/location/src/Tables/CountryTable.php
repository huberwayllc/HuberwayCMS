<?php

namespace HuberwayCMS\Location\Tables;

use HuberwayCMS\Location\Models\Country;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\CreatedAtBulkChange;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\BulkChanges\StatusBulkChange;
use HuberwayCMS\Table\BulkChanges\TextBulkChange;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class CountryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Country::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('country.edit'),
                Column::make('nationality')
                    ->title(trans('plugins/location::country.nationality'))
                    ->alignStart(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('country.create'))
            ->addActions([
                EditAction::make()->route('country.edit'),
                DeleteAction::make()->route('country.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('country.destroy'))
            ->addBulkChanges([
                TextBulkChange::make()
                    ->name('nationality')
                    ->title(trans('plugins/location::country.nationality')),
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'nationality',
                        'created_at',
                        'status',
                    ]);
            });
    }
}
