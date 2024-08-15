<?php

namespace HuberwayCMS\Setting\Http\Controllers;

use HuberwayCMS\Base\Facades\EmailHandler;
use HuberwayCMS\Base\Http\Controllers\BaseController;
use HuberwayCMS\Setting\Http\Requests\EmailSendTestRequest;
use Exception;

class EmailTestController extends BaseController
{
    public function __invoke(EmailSendTestRequest $request)
    {
        try {
            EmailHandler::send(
                file_get_contents(core_path('setting/resources/email-templates/test.tpl')),
                'Test',
                $request->input('email'),
                [],
                true
            );

            return $this
                ->httpResponse()
                ->setMessage(trans('core/setting::setting.test_email_send_success'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }
}
