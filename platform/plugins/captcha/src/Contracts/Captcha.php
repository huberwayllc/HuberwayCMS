<?php

namespace HuberwayCMS\Captcha\Contracts;

abstract class Captcha
{
    public const RECAPTCHA_CLIENT_API_URL = 'https://www.google.com/recaptcha/api.js';

    public const RECAPTCHA_VERIFY_API_URL = 'https://www.google.com/recaptcha/api/siteverify';

    public const RECAPTCHA_INPUT_NAME = 'g-recaptcha-response';

    public function __construct(protected string|null $siteKey, protected string|null $secretKey)
    {
    }

    abstract public function verify(string $response, string $clientIp, array $options = []): bool;

    abstract public function display(array $attributes = [], array $options = []): string|null;

    public function rules(): array
    {
        if (! $this->reCaptchaEnabled()) {
            return [];
        }

        return [self::RECAPTCHA_INPUT_NAME => 'captcha'];
    }

    public function isEnabled(): bool
    {
        return $this->reCaptchaEnabled();
    }

    public function reCaptchaEnabled(): bool
    {
        if (! $this->siteKey || ! $this->secretKey) {
            return false;
        }

        return (bool)setting('enable_captcha');
    }

    public function mathCaptchaEnabled(): bool
    {
        return (bool)setting('enable_math_captcha');
    }

    public function mathCaptchaRules(): array
    {
        return ['math-captcha' => 'required|string|math_captcha'];
    }

    public function captchaType(): string
    {
        return $this->reCaptchaType();
    }

    public function reCaptchaType(): string
    {
        return setting('captcha_type', 'v2') ?: 'v2';
    }

    public function attributes(): array
    {
        return [
            'captcha' => __('Captcha'),
            'math-captcha' => __('Math Captcha'),
        ];
    }

    public function scores(): array
    {
        $scores = [];

        foreach (range(1, 9) as $i) {
            $key = $i / 10;
            $scores[(string) $key] = (string) $key;
        }

        return $scores;
    }
}
