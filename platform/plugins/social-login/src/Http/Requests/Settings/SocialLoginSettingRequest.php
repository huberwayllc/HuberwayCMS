<?php

namespace HuberwayCMS\SocialLogin\Http\Requests\Settings;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\SocialLogin\Facades\SocialService;
use HuberwayCMS\Support\Http\Requests\Request;

class SocialLoginSettingRequest extends Request
{
    public function rules(): array
    {
        $providers = SocialService::getProviders();

        $rules = [];

        foreach (array_keys($providers) as $provider) {
            $rules = array_merge($rules, $this->generateRule($provider));
        }

        return $rules;
    }

    protected function generateRule(string $provider): array
    {
        $enableKey = sprintf('social_login_%s_enable', $provider);

        $rule = ['nullable', 'required_if:' . $enableKey . ',1' ];

        return [
            $enableKey => new OnOffRule(),
            sprintf('social_login_%s_app_id', $provider) => $rule,
            sprintf('social_login_%s_app_secret', $provider) => $rule,
        ];
    }
}
