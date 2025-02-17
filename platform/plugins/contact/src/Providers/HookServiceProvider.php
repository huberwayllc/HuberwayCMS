<?php

namespace HuberwayCMS\Contact\Providers;

use HuberwayCMS\Base\Rules\OnOffRule;
use HuberwayCMS\Base\Supports\ServiceProvider;
use HuberwayCMS\Captcha\Forms\CaptchaSettingForm;
use HuberwayCMS\Contact\Enums\ContactStatusEnum;
use HuberwayCMS\Contact\Models\Contact;
use HuberwayCMS\Shortcode\Compilers\Shortcode;
use HuberwayCMS\Theme\Facades\Theme;
use Illuminate\Support\Facades\Auth;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        add_filter(BASE_FILTER_TOP_HEADER_LAYOUT, [$this, 'registerTopHeaderNotification'], 120);
        add_filter(BASE_FILTER_APPEND_MENU_NAME, [$this, 'getUnreadCount'], 120, 2);
        add_filter(BASE_FILTER_MENU_ITEMS_COUNT, [$this, 'getMenuItemCount'], 120);

        if (is_plugin_active('captcha') && class_exists(CaptchaSettingForm::class)) {
            CaptchaSettingForm::beforeRendering(function (CaptchaSettingForm $form): CaptchaSettingForm {
                return $form
                    ->addAfter('open_fieldset_math_captcha_setting', 'enable_math_captcha_for_contact_form', 'onOffCheckbox', [
                        'label' => trans('plugins/contact::contact.settings.enable_math_captcha_in_contact_form'),
                        'value' => setting('enable_math_captcha_for_contact_form', false),
                    ]);
            }, 9999);

            add_filter('captcha_settings_validation_rules', [$this, 'addContactSettingRules'], 99);
        }

        if (function_exists('add_shortcode')) {
            shortcode()
                ->register(
                    'contact-form',
                    trans('plugins/contact::contact.shortcode_name'),
                    trans('plugins/contact::contact.shortcode_description'),
                    [$this, 'form']
                )
                ->setAdminConfig('contact-form', fn () => view('plugins/contact::partials.short-code-admin-config')->render());
        }
    }

    public function registerTopHeaderNotification(string|null $options): string|null
    {
        if (Auth::guard()->user()->hasPermission('contacts.edit')) {
            $contacts = Contact::query()
                ->where('status', ContactStatusEnum::UNREAD)
                ->select(['id', 'name', 'email', 'phone', 'created_at'])
                ->orderByDesc('created_at')
                ->paginate(10);

            if ($contacts->total() == 0) {
                return $options;
            }

            return $options . view('plugins/contact::partials.notification', compact('contacts'))->render();
        }

        return $options;
    }

    public function getUnreadCount(string|null|int $number, string $menuId): int|string|null
    {
        if ($menuId !== 'cms-plugins-contact') {
            return $number;
        }

        return view('core/base::partials.navbar.badge-count', ['class' => 'unread-contacts'])->render();
    }

    public function getMenuItemCount(array $data = []): array
    {
        if (! Auth::guard()->user()->hasPermission('contacts.index')) {
            return $data;
        }

        $data[] = [
            'key' => 'unread-contacts',
            'value' => Contact::query()->where('status', ContactStatusEnum::UNREAD)->count(),
        ];

        return $data;
    }

    public function form(Shortcode $shortcode): string
    {
        $view = apply_filters(CONTACT_FORM_TEMPLATE_VIEW, 'plugins/contact::forms.contact');

        if (defined('THEME_OPTIONS_MODULE_SCREEN_NAME')) {
            $this->app->booted(function () {
                Theme::asset()
                    ->usePath(false)
                    ->add('contact-css', asset('vendor/core/plugins/contact/css/contact-public.css'), [], [], '1.0.0');

                Theme::asset()
                    ->container('footer')
                    ->usePath(false)
                    ->add(
                        'contact-public-js',
                        asset('vendor/core/plugins/contact/js/contact-public.js'),
                        ['jquery'],
                        [],
                        '1.0.0'
                    );
            });
        }

        if ($shortcode->view && view()->exists($shortcode->view)) {
            $view = $shortcode->view;
        }

        return view($view, compact('shortcode'))->render();
    }

    public function addContactSettingRules(array $rules): array
    {
        return array_merge($rules, [
            'enable_math_captcha_for_contact_form' => new OnOffRule(),
        ]);
    }
}
