<?php

namespace HuberwayCMS\Page\Http\Controllers;

use HuberwayCMS\Base\Http\Actions\DeleteResourceAction;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Base\Supports\Breadcrumb;
use HuberwayCMS\Page\Forms\PageForm;
use HuberwayCMS\Page\Http\Requests\PageRequest;
use HuberwayCMS\Page\Models\Page;
use HuberwayCMS\Page\Tables\PageTable;
use Illuminate\Support\Facades\Auth;

class PageController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('packages/page::pages.menu_name'), route('pages.index'));
    }

    public function index(PageTable $pageTable)
    {
        $this->pageTitle(trans('packages/page::pages.menu_name'));

        return $pageTable->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('packages/page::pages.create'));

        return PageForm::create()->renderForm();
    }

    public function store(PageRequest $request)
    {
        $form = PageForm::create()->setRequest($request);

        $form->saving(function (PageForm $form) {
            $form
                ->getModel()
                ->fill([...$form->getRequest()->input(), 'user_id' => Auth::guard()->id()])
                ->save();
        });

        return $this
            ->httpResponse()
            ->setPreviousRoute('pages.index')
            ->setNextRoute('pages.edit', $form->getModel()->getKey())
            ->withCreatedSuccessMessage();
    }

    public function edit(Page $page)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $page->name]));

        return PageForm::createFromModel($page)->renderForm();
    }

    public function update(Page $page, PageRequest $request)
    {
        PageForm::createFromModel($page)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousRoute('pages.index')
            ->withUpdatedSuccessMessage();
    }

    public function destroy(Page $page)
    {
        return DeleteResourceAction::make($page);
    }
}
