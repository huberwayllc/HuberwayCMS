<?php

namespace HuberwayCMS\Contact\Tables;

use HuberwayCMS\Contact\Enums\ContactStatusEnum;
use HuberwayCMS\Contact\Exports\ContactExport;
use HuberwayCMS\Contact\Models\Contact;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\CreatedAtBulkChange;
use HuberwayCMS\Table\BulkChanges\EmailBulkChange;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\BulkChanges\PhoneBulkChange;
use HuberwayCMS\Table\BulkChanges\StatusBulkChange;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\EmailColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\PhoneColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Validation\Rule;

class ContactTable extends TableAbstract
{
    protected string $exportClass = ContactExport::class;

    public function setup(): void
    {
        $this
            ->model(Contact::class)
            ->addActions([
                EditAction::make()->route('contacts.edit'),
                DeleteAction::make()->route('contacts.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('contacts.edit'),
                EmailColumn::make()->linkable(),
                PhoneColumn::make()->linkable(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('contacts.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                EmailBulkChange::make(),
                StatusBulkChange::make()
                    ->choices(ContactStatusEnum::labels())
                    ->validate(['required', Rule::in(ContactStatusEnum::values())]),
                CreatedAtBulkChange::make(),
                PhoneBulkChange::make()->title(trans('plugins/contact::contact.sender_phone')),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'phone',
                        'email',
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
