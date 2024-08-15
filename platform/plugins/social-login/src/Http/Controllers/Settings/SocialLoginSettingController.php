<?php

namespace HuberwayCMS\SocialLogin\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Setting\Http\Controllers\SettingController;
use HuberwayCMS\SocialLogin\Facades\SocialService;
use HuberwayCMS\SocialLogin\Forms\SocialLoginSettingForm;
use HuberwayCMS\SocialLogin\Http\Requests\Settings\SocialLoginSettingRequest;
use Illuminate\Support\Arr;

class SocialLoginSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/social-login::social-login.settings.title'));

        return SocialLoginSettingForm::create()->renderForm();
    }

    public function update(SocialLoginSettingRequest $request): BaseHttpResponse
    {
        $prefix = 'social_login_';

        $data = [
            "{$prefix}enable" => $request->input("{$prefix}enable"),
        ];

        foreach (SocialService::getProviders() as $provider => $item) {
            $prefix = 'social_login_' . $provider . '_';

            $data["{$prefix}enable"] = $request->input("{$prefix}enable");

            foreach ($item['data'] as $input) {
                if (
                    ! in_array(app()->environment(), SocialService::getEnvDisableData()) ||
                    ! in_array($input, Arr::get($item, 'disable', []))
                ) {
                    $data["{$prefix}{$input}"] = $request->input("{$prefix}{$input}");
                }
            }
        }

        return $this->performUpdate($data);
    }
}
