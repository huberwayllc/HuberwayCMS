<?php

namespace HuberwayCMS\Ads\Http\Controllers;

use HuberwayCMS\Ads\Forms\AdsForm;
use HuberwayCMS\Ads\Http\Requests\AdsRequest;
use HuberwayCMS\Ads\Models\Ads;
use HuberwayCMS\Ads\Tables\AdsTable;
use HuberwayCMS\Base\Events\BeforeEditContentEvent;
use HuberwayCMS\Base\Facades\PageTitle;
use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use Illuminate\Http\Request;

class AdsController extends BaseController
{
    public function index(AdsTable $table)
    {
        PageTitle::setTitle(trans('plugins/ads::ads.name'));

        return $table->renderTable();
    }

    public function create()
    {
        PageTitle::setTitle(trans('plugins/ads::ads.create'));

        return AdsForm::create()->renderForm();
    }

    public function store(AdsRequest $request, BaseHttpResponse $response)
    {
        $form = AdsForm::create()->setRequest($request);
        $form->save();

        return $response
            ->setPreviousUrl(route('ads.index'))
            ->setNextUrl(route('ads.edit', $form->getModel()->id))
            ->withCreatedSuccessMessage();
    }

    public function edit(Ads $ads, Request $request)
    {
        event(new BeforeEditContentEvent($request, $ads));

        PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $ads->name]));

        return AdsForm::createFromModel($ads)->renderForm();
    }

    public function update(Ads $ads, AdsRequest $request, BaseHttpResponse $response)
    {
        AdsForm::createFromModel($ads)
            ->setRequest($request)
            ->save();

        return $response
            ->setPreviousUrl(route('ads.index'))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Ads $ads)
    {
        return DeleteResourceAction::make($ads);
    }
}
