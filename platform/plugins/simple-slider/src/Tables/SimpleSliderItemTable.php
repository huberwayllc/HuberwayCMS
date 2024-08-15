<?php

namespace HuberwayCMS\SimpleSlider\Tables;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Facades\Html;
use HuberwayCMS\SimpleSlider\Models\SimpleSliderItem;
use HuberwayCMS\Table\Abstracts\TableAbstract;
use HuberwayCMS\Table\Actions\Action;
use HuberwayCMS\Table\Actions\DeleteAction;
use HuberwayCMS\Table\Columns\Column;
use HuberwayCMS\Table\Columns\CreatedAtColumn;
use HuberwayCMS\Table\Columns\FormattedColumn;
use HuberwayCMS\Table\Columns\IdColumn;
use HuberwayCMS\Table\Columns\ImageColumn;
use Illuminate\Database\Eloquent\Builder;

class SimpleSliderItemTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SimpleSliderItem::class)
            ->setView('plugins/simple-slider::items')
            ->setDom($this->simpleDom())
            ->addColumns([
                IdColumn::make(),
                ImageColumn::make(),
                FormattedColumn::make('title')
                    ->title(trans('core/base::tables.title'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        $item = $column->getItem();

                        $name = BaseHelper::clean($item->title);

                        if (! $this->hasPermission('simple-slider-item.edit')) {
                            return $name;
                        }

                        return $name ? Html::link(route('simple-slider-item.edit', $item->getKey()), $name, [
                            'data-bs-toggle' => 'modal',
                            'data-bs-target' => '#simple-slider-item-modal',
                        ]) : '&mdash;';
                    }),
                Column::make('order')
                    ->title(trans('core/base::tables.order'))
                    ->className('text-start order-column'),
                CreatedAtColumn::make(),
            ])
            ->addActions([
                Action::make('customEdit')
                    ->route('simple-slider-item.edit')
                    ->icon('ti ti-edit')
                    ->attributes([
                        'data-bs-toggle' => 'modal',
                        'data-bs-target' => '#simple-slider-item-modal',
                    ])
                    ->permission('simple-slider-item.edit'),
                DeleteAction::make()
                    ->route('simple-slider-item.destroy')
                    ->permission('simple-slider-item.destroy'),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'title',
                        'image',
                        'order',
                        'created_at',
                    ])
                    ->orderBy('order')
                    ->where('simple_slider_id', request()->route()->parameter('id'));
            });
    }
}
