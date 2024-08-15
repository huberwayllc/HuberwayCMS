<?php

namespace HuberwayCMS\Ads\Tables;

use HuberwayCMS\Ads\Models\Ads;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\DateBulkChange;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\BulkChanges\StatusBulkChange;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\DateColumn;
use HuberwayCMS\Table\Columns\FormattedColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\ImageColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\HeaderActions\CreateHeaderAction;

class AdsTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Ads::class)
            ->addColumns([
                IdColumn::make(),
                ImageColumn::make(),
                NameColumn::make()->route('ads.edit'),
                FormattedColumn::make('key')
                    ->title(trans('plugins/ads::ads.shortcode'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        $value = $column->getItem()->key;

                        if (! function_exists('shortcode')) {
                            return $value;
                        }

                        return shortcode()->generateShortcode('ads', ['key' => $value]);
                    })
                    ->renderUsing(fn (FormattedColumn $column) => Html::tag('code', $column->getValue()))
                    ->copyable(),
                Column::make('clicked')
                    ->title(trans('plugins/ads::ads.clicked'))
                    ->alignStart(),
                DateColumn::make('expired_at'),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('ads.create'))
            ->addActions([
                EditAction::make()->route('ads.edit'),
                DeleteAction::make()->route('ads.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('ads.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                DateBulkChange::make()->name('expired_at')->title(trans('plugins/ads::ads.expired_at')),
            ])
            ->queryUsing(function ($query) {
                $query->select([
                    'id',
                    'image',
                    'key',
                    'name',
                    'clicked',
                    'expired_at',
                    'status',
                ]);
            });
    }
}
