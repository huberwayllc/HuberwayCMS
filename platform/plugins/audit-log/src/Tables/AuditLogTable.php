<?php

namespace HuberwayCMS\AuditLog\Tables;

use HuberwayCMS\AuditLog\Models\AuditHistory;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\Columns\FormattedColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\HeaderActions\HeaderAction;
use Illuminate\Contracts\Database\Eloquent\Builder;

class AuditLogTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(AuditHistory::class)
            ->setView('plugins/audit-log::table')
            ->addColumns([
                IdColumn::make(),
                FormattedColumn::make('action')
                    ->title(trans('plugins/audit-log::history.action'))
                    ->alignStart()
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/audit-log::activity-line', ['history' => $column->getItem()])->render();
                    }),
            ])
            ->addHeaderActions([
                HeaderAction::make('empty')
                    ->label(trans('plugins/audit-log::history.delete_all'))
                    ->icon('ti ti-trash')
                    ->url('javascript:void(0)')
                    ->attributes(['class' => 'empty-activities-logs-button']),
            ])
            ->addAction(DeleteAction::make()->route('audit-log.destroy'))
            ->addBulkAction(DeleteBulkAction::make()->permission('audit-log.destroy'))
            ->queryUsing(fn (Builder $query) => $query->with('user'));
    }
}
