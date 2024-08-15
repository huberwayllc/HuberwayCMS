<?php

namespace HuberwayCMS\SimpleSlider\Http\Controllers;

use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\SimpleSlider\Forms\SimpleSliderItemForm;
use HuberwayCMS\SimpleSlider\Http\Requests\SimpleSliderItemRequest;
use HuberwayCMS\SimpleSlider\Models\SimpleSliderItem;
use HuberwayCMS\SimpleSlider\Tables\SimpleSliderItemTable;

class SimpleSliderItemController extends BaseController
{
    public function index(SimpleSliderItemTable $dataTable)
    {
        return $dataTable->renderTable();
    }

    public function create()
    {
        $form = SimpleSliderItemForm::create()
            ->setUseInlineJs(true)
            ->renderForm();

        return $this
            ->httpResponse()
            ->setData([
                'title' => trans('plugins/simple-slider::simple-slider.create_new_slide'),
                'content' => $form,
            ]);
    }

    public function store(SimpleSliderItemRequest $request)
    {
        SimpleSliderItemForm::create()->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->withCreatedSuccessMessage();
    }

    public function edit(int|string $id)
    {
        $simpleSliderItem = SimpleSliderItem::query()->findOrFail($id);

        $form = SimpleSliderItemForm::createFromModel($simpleSliderItem)
            ->setUseInlineJs(true)
            ->renderForm();

        return $this
            ->httpResponse()
            ->setData([
                'title' => trans('plugins/simple-slider::simple-slider.edit_slide', ['id' => $simpleSliderItem->getKey()]),
                'content' => $form,
            ]);
    }

    public function update(int|string $id, SimpleSliderItemRequest $request)
    {
        $simpleSliderItem = SimpleSliderItem::query()->findOrFail($id);

        SimpleSliderItemForm::createFromModel($simpleSliderItem)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function destroy(int|string $id)
    {
        $simpleSliderItem = SimpleSliderItem::query()->findOrFail($id);

        return DeleteResourceAction::make($simpleSliderItem);
    }
}
