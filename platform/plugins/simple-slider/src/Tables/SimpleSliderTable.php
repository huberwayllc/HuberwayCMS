<?php

namespace HuberwayCMS\SimpleSlider\Tables;

use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\SimpleSlider\Models\SimpleSlider;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Actions\EditAction;
use HuberwayCMS\Table\BulkActions\DeleteBulkAction;
use HuberwayCMS\Table\BulkChanges\CreatedAtBulkChange;
use HuberwayCMS\Table\BulkChanges\NameBulkChange;
use HuberwayCMS\Table\BulkChanges\StatusBulkChange;
use HuberwayCMS\Table\BulkChanges\TextBulkChange;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\FormattedColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\NameColumn;
use HuberwayCMS\Table\Columns\StatusColumn;
use HuberwayCMS\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class SimpleSliderTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SimpleSlider::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('simple-slider.create'))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('simple-slider.edit'),
                FormattedColumn::make('key')
                    ->title(trans('plugins/simple-slider::simple-slider.shortcode'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        $value = $column->getItem()->key;

                        if (! function_exists('shortcode')) {
                            return $value;
                        }

                        return shortcode()->generateShortcode('simple-slider', ['alias' => $value]);
                    })
                    ->renderUsing(fn (FormattedColumn $column) => Html::tag('code', $column->getValue()))
                    ->copyable(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addActions([
                EditAction::make()->route('simple-slider.edit'),
                DeleteAction::make()->route('simple-slider.destroy'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('simple-slider.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                TextBulkChange::make()
                    ->name('key')
                    ->title(trans('plugins/simple-slider::simple-slider.key')),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'key',
                        'status',
                        'created_at',
                    ]);
            });
    }
}
