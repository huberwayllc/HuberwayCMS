<?php

namespace HuberwayCMS\Ecommerce\Http\Controllers;

use HuberwayCMS\Base\Events\CreatedContentEvent;
use HuberwayCMS\Base\Events\DeletedContentEvent;
use HuberwayCMS\Base\Events\UpdatedContentEvent;
use HuberwayCMS\Base\Facades\PageTitle;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Ecommerce\Forms\TaxRuleForm;
use HuberwayCMS\Ecommerce\Http\Requests\TaxRuleRequest;
use HuberwayCMS\Ecommerce\Models\Tax;
use HuberwayCMS\Ecommerce\Models\TaxRule;
use HuberwayCMS\Ecommerce\Tables\TaxRuleTable;
use Exception;
use Illuminate\Http\Request;

class TaxRuleController extends BaseController
{
    public function index(Tax $tax, TaxRuleTable $dataTable)
    {
        $this->pageTitle(trans('plugins/ecommerce::tax.rule.name', ['title' => $tax->title]));

        return $dataTable->renderTable();
    }

    public function create(Request $request)
    {
        $this->pageTitle(trans('plugins/ecommerce::tax.rule.create'));

        $form = TaxRuleForm::create()->renderForm();
        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData(['html' => $form])
                ->setMessage(PageTitle::getTitle(false));
        }

        return $form;
    }

    public function store(TaxRuleRequest $request)
    {
        $rule = TaxRule::query()->create($request->input());

        event(new CreatedContentEvent(TAX_RULE_MODULE_SCREEN_NAME, $request, $rule));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('tax.rule.index', $rule->tax_id))
            ->setNextUrl(route('tax.rule.edit', $rule->id))
            ->withCreatedSuccessMessage();
    }

    public function edit(TaxRule $rule, TaxRuleRequest $request)
    {
        $this->pageTitle(trans('plugins/ecommerce::tax.rule.edit', ['title' => '#' . $rule->id]));

        $form = TaxRuleForm::createFromModel($rule)->renderForm();

        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData(['html' => $form])
                ->setMessage(PageTitle::getTitle(false));
        }

        return $form;
    }

    public function update(TaxRule $rule, TaxRuleRequest $request)
    {
        $rule->fill($request->input());
        $rule->save();

        event(new UpdatedContentEvent(TAX_RULE_MODULE_SCREEN_NAME, $request, $rule));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('tax.rule.index', $rule->tax_id))
            ->withUpdatedSuccessMessage();
    }

    public function destroy(TaxRule $rule, Request $request)
    {
        try {
            $rule->delete();
            event(new DeletedContentEvent(TAX_RULE_MODULE_SCREEN_NAME, $request, $rule));

            return $this
                ->httpResponse()
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }
}
