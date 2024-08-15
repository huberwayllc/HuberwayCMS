<?php

namespace HuberwayCMS\ACL\Tables;

use HuberwayCMS\ACL\Models\Role;
use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\FormattedColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\LinkableColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class RoleTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Role::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('roles.edit'),
                FormattedColumn::make('description')
                    ->title(trans('core/base::tables.description'))
                    ->alignStart()
                    ->withEmptyState(),
                CreatedAtColumn::make(),
                LinkableColumn::make('created_by')
                    ->urlUsing(fn (LinkableColumn $column) => $column->getItem()->author->url)
                    ->title(trans('core/acl::permissions.created_by'))
                    ->width(100)
                    ->getValueUsing(function (LinkableColumn $column) {
                        return BaseHelper::clean($column->getItem()->author->name);
                    })
                    ->externalLink()
                    ->withEmptyState(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('roles.create'))
            ->addActions([
                EditAction::make()->route('roles.edit'),
                DeleteAction::make()->route('roles.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('roles.destroy'))
            ->addBulkChange(NameBulkChange::make())
            ->queryUsing(function (Builder $query) {
                $query
                    ->with('author')
                    ->select([
                        'id',
                        'name',
                        'description',
                        'created_at',
                        'created_by',
                    ]);
            });
    }
}
