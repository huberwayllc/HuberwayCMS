<?php

namespace HuberwayCMS\Language\Http\Controllers\Settings;

use HuberwayCMS\Base\Http\Responses\BaseHttpResponse;
use HuberwayCMS\Language\Http\Requests\Settings\LanguageSettingRequest;
use HuberwayCMS\Setting\Http\Controllers\SettingController;

class LanguageSettingController extends SettingController
{
    public function update(LanguageSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate([
            ...$request->validated(),
            'language_hide_languages' => $request->input('language_hide_languages', []),
        ]);
    }
}
