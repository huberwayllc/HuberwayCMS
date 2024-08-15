<?php

namespace HuberwayCMS\Setting\Http\Controllers;

use HuberwayCMS\Base\Facades\BaseHelper;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Setting\Http\Traits\GetEmailTemplateDataTrait;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class EmailTemplatePreviewController extends BaseController
{
    use GetEmailTemplateDataTrait;

    public function __invoke(Request $request, string $type, string $module, string $template): View
    {
        [$inputData, $variables] = $this->getData($request, $type, $module, $template);

        if (! empty($inputData)) {
            foreach ($inputData as $key => $value) {
                $inputData[BaseHelper::stringify($key)] = BaseHelper::clean(BaseHelper::stringify($value));
            }
        }

        $routeParams = [$type, $module, $template];

        $backUrl = route('settings.email.template.edit', $routeParams);

        $iframeUrl = route('settings.email.template.iframe', $routeParams);

        return view(
            'core/setting::preview-email',
            compact('variables', 'inputData', 'backUrl', 'iframeUrl')
        );
    }
}
