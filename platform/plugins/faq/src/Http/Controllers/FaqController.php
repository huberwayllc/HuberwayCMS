<?php

namespace HuberwayCMS\Faq\Http\Controllers;

use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Supports\Breadcrumb;
use HuberwayCMS\Faq\Forms\FaqForm;
use HuberwayCMS\Faq\Http\Requests\FaqRequest;
use HuberwayCMS\Faq\Models\Faq;
use HuberwayCMS\Faq\Tables\FaqTable;

class FaqController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/faq::faq.name'), route('faq.index'));
    }

    public function index(FaqTable $table)
    {
        $this->pageTitle(trans('plugins/faq::faq.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/faq::faq.create'));

        return FaqForm::create()->renderForm();
    }

    public function store(FaqRequest $request)
    {
        $form = FaqForm::create()->setRequest($request);
        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('faq.index')
            ->setNextRoute('faq.edit', $form->getModel()->getKey())
            ->withCreatedSuccessMessage();
    }

    public function edit(Faq $faq)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $faq->question]));

        return FaqForm::createFromModel($faq)->renderForm();
    }

    public function update(Faq $faq, FaqRequest $request)
    {
        FaqForm::createFromModel($faq)->setRequest($request)->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('faq.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Faq $faq)
    {
        return DeleteResourceAction::make($faq);
    }
}
